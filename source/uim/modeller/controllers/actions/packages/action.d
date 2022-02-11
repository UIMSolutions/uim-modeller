module uim.modeller.controllers.actions.packages.action;


@safe:
import uim.modeller;

class DMDLPackageAction : DMDLAction {
 mixin(APPControllerThis!("MDLPackageAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/packages") 
    .collectionName("modeller_packages"); 
  }
}
mixin(APPControllerCalls!("MDLPackageAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLPackageAction);
  }
}