module uim.modeller.controllers.actions.apis.action;


@safe:
import uim.modeller;

class DMDLApiAction : DMDLAction {
  mixin(APPControllerThis!("MDLApiAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/apis") 
    .collectionName("modeller_apis"); 
  }
}
mixin(APPControllerCalls!("MDLApiAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLApiAction);
  }
}