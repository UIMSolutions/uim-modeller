module uim.modeller.controllers.actions.interfaces.action;


@safe:
import uim.modeller;

class DMDLInterfaceAction : DMDLAction {
 mixin(APPControllerThis!("MDLInterfaceAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/interfaces") 
    .collectionName("modeller_interfaces"); 
  }
}
mixin(APPControllerCalls!("MDLInterfaceAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLInterfaceAction);
  }
}