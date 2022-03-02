module uim.modeller.controllers.actions.methods.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteMethod : DMDLMethodAction {
  mixin(APPControllerThis!("MDLAction_DeleteMethod"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteMethod~":DMDLAction_DeleteMethod::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    auto entity = MDLMethod.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteMethod"));
