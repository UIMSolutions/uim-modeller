module uim.modeller.controllers.actions.apis.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteApi : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteApi"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteApi"));
