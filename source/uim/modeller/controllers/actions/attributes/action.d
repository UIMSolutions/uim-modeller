module uim.modeller.controllers.actions.attributes.action;


@safe:
import uim.modeller;

class DMDLAttributeAction : DMDLAction {
 mixin(APPControllerThis!("MDLAttributeAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/attributes") 
    .collectionName("attributes"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeAction~":DMDLAttributeAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("MDLAttributeAction"));

version(test_uim_cms) {
  unittest {
    testController(MDLAttributeAction);
  }
}