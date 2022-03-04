module uim.modeller.controllers.actions.methods.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateMethod : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateMethod"));

  override void initialize() {
    super.initialize;

    this._initInterfacesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateMethod"));
