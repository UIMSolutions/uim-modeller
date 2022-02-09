module uim.modeller.controllers.actions.models.action;


@safe:
import uim.modeller;

class DMDLModelAction : DMDLAction {
 mixin(APPControllerThis!("MDLModelAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/models") 
    .collectionName("modeller_models"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelAction~":DMDLModelAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("MDLModelAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLModelAction);
  }
}