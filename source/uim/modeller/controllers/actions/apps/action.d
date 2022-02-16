module uim.modeller.controllers.actions.apps.action;


@safe:
import uim.modeller;

class DMDLAppAction : DMDLAction {
 mixin(APPControllerThis!("MDLAppAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/apps") 
    .collectionName("modeller_apps"); 
  }
}
mixin(APPControllerCalls!("MDLAppAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLAppAction);
  }
}