module uim.modeller.controllers.actions.interfaces.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateInterface : DMDLInterfaceAction {
  mixin(APPControllerThis!("MDLAction_UpdateInterface"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateInterface~":DMDLAction_UpdateInterface::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

  

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site.name, collectionName].findOne(UUID(entityId));
      
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
mixin(APPControllerCalls!("MDLAction_UpdateInterface"));
