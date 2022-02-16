module uim.modeller.controllers.actions.libraries.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteLibrary : DMDLLibraryAction {
  mixin(APPControllerThis!("MDLAction_DeleteLibrary"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteLibrary~":DMDLAction_DeleteLibrary::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLLibrary.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteLibrary"));
