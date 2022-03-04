module uim.modeller.controllers.actions.interfaces.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteInterface : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteInterface"));

  override void initialize() {
    super.initialize;

    this._initInterfacesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteInterface"));
