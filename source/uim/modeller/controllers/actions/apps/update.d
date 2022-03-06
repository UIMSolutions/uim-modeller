module uim.modeller.controllers.actions.apps.update;

@safe:
import uim.modeller;

class DMDLAppUpdateAction : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAppUpdateAction"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAppUpdateAction"));
