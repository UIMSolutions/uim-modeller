module uim.modeller.controllers.actions.apis.update;

@safe:
import uim.modeller;

class DMDLApiUpdateAction : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLApiUpdateAction"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLApiUpdateAction"));
