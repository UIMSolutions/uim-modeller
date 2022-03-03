module uim.modeller.controllers.actions.apis.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateApi : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateApi"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateApi"));
