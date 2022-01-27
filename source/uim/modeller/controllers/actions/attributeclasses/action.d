module uim.modeller.controllers.actions.attributeclasses.action;

@safe:
import uim.modeller;

class DMDLAttributeClassAction : DMDLAction {
 mixin(APPControllerThis!("MDLAttributeClassAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/attributeclasses") 
    .collectionName("attributeclasses"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassAction~":DMDLAttributeClassAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("MDLAttributeClassAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLAttributeClassAction);
  }
}