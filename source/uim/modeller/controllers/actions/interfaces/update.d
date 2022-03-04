module uim.modeller.controllers.actions.interfaces.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateInterface : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateInterface"));

  override void initialize() {
    super.initialize;

    this._initInterfacesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateInterface"));
