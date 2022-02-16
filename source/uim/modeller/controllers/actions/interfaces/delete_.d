module uim.modeller.controllers.actions.interfaces.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteInterface : DMDLInterfaceAction {
  mixin(APPControllerThis!("MDLAction_DeleteInterface"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteInterface~":DMDLAction_DeleteInterface::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLInterface.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteInterface"));
