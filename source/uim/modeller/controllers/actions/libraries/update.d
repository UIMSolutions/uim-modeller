module uim.modeller.controllers.actions.libraries.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateLibrary : DMDLLibraryAction {
  mixin(APPControllerThis!("MDLAction_UpdateLibrary"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdateLibrary~":DMDLAction_UpdateLibrary::beforeResponse");
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
mixin(APPControllerCalls!("MDLAction_UpdateLibrary"));
