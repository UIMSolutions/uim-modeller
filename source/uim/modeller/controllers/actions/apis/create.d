module uim.modeller.controllers.actions.apis.create;

@safe:
import uim.modeller;

class DMDLApiCreateAction : DMDLCreateAction {
  mixin(APPControllerThis!("MDLApiCreateAction"));

  override void initialize() {
    super.initialize;

    _initApiAction(this);
  }
}
mixin(APPControllerCalls!("MDLApiCreateAction"));
