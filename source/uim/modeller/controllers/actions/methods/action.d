module uim.modeller.controllers.actions.methods.action;


@safe:
import uim.modeller;

class DMDLMethodAction : DMDLAction {
 mixin(APPControllerThis!("MDLMethodAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/methods") 
    .collectionName("modeller_methods"); 
  }
}
mixin(APPControllerCalls!("MDLMethodAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLMethodAction);
  }
}