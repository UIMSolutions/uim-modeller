module uim.modeller.controllers.actions.classes.action;


@safe:
import uim.modeller;

class DMDLClassAction : DMDLAction {
 mixin(APPControllerThis!("MDLClassAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/classes") 
    .collectionName("modeller_classes"); 
  }
}
mixin(APPControllerCalls!("MDLClassAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLClassAction);
  }
}