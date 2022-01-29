module uim.modeller.controllers.actions.attributeclasses.action;

@safe:
import uim.modeller;

class DMDLAttributeClassAction : DMDLAction {
 mixin(APPControllerThis!("MDLAttributeClassAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/attributeclasses") 
    .collectionName("modeller_attributeclasses"); 
  }
}
mixin(APPControllerCalls!("MDLAttributeClassAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLAttributeClassAction);
  }
}