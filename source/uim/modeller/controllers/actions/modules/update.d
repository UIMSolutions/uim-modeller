module uim.modeller.controllers.actions.modules.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateModule : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateModule"));

  override void initialize() {
    super.initialize;

    this._initModulesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateModule"));
