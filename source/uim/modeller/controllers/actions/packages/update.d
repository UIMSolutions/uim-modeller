module uim.modeller.controllers.actions.packages.update;

@safe:
import uim.modeller;

class DMDLAction_UpdatePackage : DMDLPackageAction {
  mixin(APPControllerThis!("MDLAction_UpdatePackage"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_UpdatePackage~":DMDLAction_UpdatePackage::beforeResponse");
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
mixin(APPControllerCalls!("MDLAction_UpdatePackage"));
