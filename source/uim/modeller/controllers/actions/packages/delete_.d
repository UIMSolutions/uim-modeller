module uim.modeller.controllers.actions.packages.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeletePackage : DMDLPackageAction {
  mixin(APPControllerThis!("MDLAction_DeletePackage"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeletePackage~":DMDLAction_DeletePackage::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    auto entity = MDLPackage.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeletePackage"));
