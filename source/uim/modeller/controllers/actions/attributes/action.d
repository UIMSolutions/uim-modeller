module uim.modeller.controllers.actions.attributes.action;


@safe:
import uim.modeller;

class DMDLAttributeAction : DMDLAction {
 mixin(APPControllerThis!("MDLAttributeAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/attributes") 
    .collectionName("modeller_attributes"); 
  }
}
mixin(APPControllerCalls!("MDLAttributeAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLAttributeAction);
  }
}