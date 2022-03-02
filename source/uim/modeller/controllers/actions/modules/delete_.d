module uim.modeller.controllers.actions.modules.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteModule : DMDLModuleAction {
  mixin(APPControllerThis!("MDLAction_DeleteModule"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteModule~":DMDLAction_DeleteModule::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    auto entity = MDLModule.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteModule"));
