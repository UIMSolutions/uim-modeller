module uim.modeller.controllers.actions.modules.create;

@safe:
import uim.modeller;

class DMDLAction_CreateModule : DMDLModuleAction {
  mixin(APPControllerThis!("MDLAction_CreateModule"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/modules") 
    .collectionName("modeller_modules"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateModule"));
