module uim.modeller.controllers.actions.modules.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteModule : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteModule"));

  override void initialize() {
    super.initialize;

    this._initModulesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteModule"));
