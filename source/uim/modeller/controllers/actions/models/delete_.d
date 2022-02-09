module uim.modeller.controllers.actions.models.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteModel : DMDLModelAction {
  mixin(APPControllerThis!("MDLAction_DeleteModel"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteModel~":DMDLAction_DeleteModel::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLModel.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteModel"));
