module uim.modeller.controllers.actions.apis.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteApi : DMDLApiAction {
  mixin(APPControllerThis!("MDLAction_DeleteApi"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteApi~":DMDLAction_DeleteApi::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLApi.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteApi"));
