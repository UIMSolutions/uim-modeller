module uim.modeller.controllers.actions.entityclasses.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateEntityClass : DMDLEntityClassAction {
  mixin(APPControllerThis!("MDLAction_UpdateEntityClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateEntityClass~":DMDLAction_UpdateEntityClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     

  

    if (auto entityId = options.get("entity_id", null)) {
      auto entity = database[appSession.site.name, collectionName].findOne(UUID(entityId));
      
      entity.fromRequest(options);

      database[appSession.site.name, collectionName].updateOne(entity);
      options["redirect"] = rootPath~"/view?id="~entityId;
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("MDLAction_UpdateEntityClass"));
