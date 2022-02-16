module uim.modeller.controllers.actions.classes.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteClass : DMDLClassAction {
  mixin(APPControllerThis!("MDLAction_DeleteClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteClass~":DMDLAction_DeleteClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLClass.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteClass"));
