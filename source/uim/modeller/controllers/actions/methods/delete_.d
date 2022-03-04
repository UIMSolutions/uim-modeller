module uim.modeller.controllers.actions.methods.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteMethod : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteMethod"));

  override void initialize() {
    super.initialize;

    this._initInterfacesAction; 
  }

}
mixin(APPControllerCalls!("MDLAction_DeleteMethod"));
