module uim.modeller.controllers.actions.entityclasses.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteEntityClass : DMDLEntityClassAction {
  mixin(APPControllerThis!("MDLAction_DeleteEntityClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteEntityClass~":DMDLAction_DeleteEntityClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    auto appSession = getAppSession(options);

    auto entity = MDLEntityClass.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteEntityClass"));
