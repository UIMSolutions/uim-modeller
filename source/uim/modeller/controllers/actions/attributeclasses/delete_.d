module uim.modeller.controllers.actions.attributeclasses.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteAttributeClass : DMDLAttributeClassAction {
  mixin(APPControllerThis!("MDLAction_DeleteAttributeClass"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteAttributeClass~":DMDLAction_DeleteAttributeClass::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    auto entity = MDLAttributeClass.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteAttributeClass"));
