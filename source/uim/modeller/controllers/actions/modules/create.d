module uim.modeller.controllers.actions.modules.create;

@safe:
import uim.modeller;

class DMDLAction_CreateModule : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateModule"));

  override void initialize() {
    super.initialize;

    this._initModulesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateModule"));
