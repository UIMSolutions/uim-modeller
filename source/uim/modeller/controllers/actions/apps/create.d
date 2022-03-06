module uim.modeller.controllers.actions.apps.create;

@safe:
import uim.modeller;

class DMDLAppCreateAction : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAppCreateAction"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAppCreateAction"));
