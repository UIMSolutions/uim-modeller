module uim.modeller.controllers.actions.modules.action;


@safe:
import uim.modeller;

class DMDLModuleAction : DMDLAction {
 mixin(APPControllerThis!("MDLModuleAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/modules") 
    .collectionName("modeller_modules"); 
  }
}
mixin(APPControllerCalls!("MDLModuleAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLModuleAction);
  }
}