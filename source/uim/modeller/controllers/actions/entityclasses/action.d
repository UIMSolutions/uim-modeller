module uim.modeller.controllers.actions.entityclasses.action;


@safe:
import uim.modeller;

class DMDLEntityClassAction : DMDLAction {
 mixin(APPControllerThis!("MDLEntityClassAction"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/entityclasses") 
    .collectionName("modeller_entityclasses"); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassAction~":DMDLEntityClassAction::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    
	}
}
mixin(APPControllerCalls!("MDLEntityClassAction"));

version(test_uim_mdl) {
  unittest {
    testController(MDLEntityClassAction);
  }
}