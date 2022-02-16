module uim.modeller.controllers.actions.apps.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteApp : DMDLAppAction {
  mixin(APPControllerThis!("MDLAction_DeleteApp"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteApp~":DMDLAction_DeleteApp::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLApp.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteApp"));
