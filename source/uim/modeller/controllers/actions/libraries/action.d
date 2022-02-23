module uim.modeller.controllers.actions.libraries.action;


@safe:
import uim.modeller;

class DMDLLibraryAction : DMDLAction {
 mixin(APPControllerThis!("MDLLibraryAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/libraries") 
    .collectionName("modeller_libraries"); 
  }
}
mixin(APPControllerCalls!("MDLLibraryAction"));

version(test_uim_mdl) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(MDLLibraryAction);
  }
}