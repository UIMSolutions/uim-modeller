module uim.modeller.controllers.actions.apis.create;

@safe:
import uim.modeller;

class DMDLAction_CreateApi : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateApi"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLAction_CreateApi"));
