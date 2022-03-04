module uim.modeller.controllers.actions.classes.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteClass : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteClass"));

  override void initialize() {
    super.initialize;

    this._initClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteClass"));
