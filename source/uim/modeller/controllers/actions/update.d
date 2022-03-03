module uim.modeller.controllers.actions.update;

@safe:
import uim.modeller;

class DMDLUpdateAction : DMDLAction {
  mixin(APPControllerThis!("MDLUpdateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLUpdateAction~":DMDLUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     
  
    if (auto tenant = database[appSession.site.name]) {
      debug writeln("Found tenant for ", appSession.site.name);
      
      if (auto collection = tenant[collectionName]) {
        debug writeln("Found collection for ", collectionName);

        if (auto entityId = options.get("entity_id", null)) {
          auto entity = collection.findOne(UUID(entityId));
          
          entity.fromRequest(options);
          foreach(name, attribute; entity.attributes) { // Workaround :-O
            if (auto booleanAttribute = cast(DOOPBooleanAttribute)attribute) {
              if ("entity_"~name !in options) booleanAttribute.value(false);  
            }
          }

          database[appSession.site.name, collectionName].updateOne(entity);
          options["redirect"] = rootPath~"/view?id="~entityId;
        }
        else {
          this.error("Entity Id not found");
        }
      }
    }
	}
}
mixin(APPControllerCalls!("MDLUpdateAction"));

version(test_uim_mdl) {
  unittest {
    // TODO
  }
}