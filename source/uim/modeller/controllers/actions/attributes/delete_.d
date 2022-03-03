module uim.modeller.controllers.actions.attributes.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteAttribute : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteAttribute"));

  override void initialize() {
    super.initialize;

    this._initAttributesAction;
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteAttribute"));
