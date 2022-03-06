module uim.modeller.controllers.actions.apps.delete_;

@safe:
import uim.modeller;

class DMDLAppDeleteAction : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAppDeleteAction"));

  override void initialize() {
    super.initialize;

    _initAppsAction(this); 
  }
}
mixin(APPControllerCalls!("MDLAppDeleteAction"));
