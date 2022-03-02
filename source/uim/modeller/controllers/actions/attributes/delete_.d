module uim.modeller.controllers.actions.attributes.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteAttribute : DMDLAttributeAction {
  mixin(APPControllerThis!("MDLAction_DeleteAttribute"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAction_DeleteAttribute~":DMDLAction_DeleteAttribute::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

  

    auto entity = MDLAttribute.fromRequest(options);  
    database[appSession.site.name, collectionName].removeOne(entity);

    options["redirect"] = rootPath;
	}
}
mixin(APPControllerCalls!("MDLAction_DeleteAttribute"));
