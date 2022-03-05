module uim.modeller.controllers.actions.apis.delete_;

@safe:
import uim.modeller;

class DMDLApiDeleteAction : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLApiDeleteAction"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLApiDeleteAction"));
