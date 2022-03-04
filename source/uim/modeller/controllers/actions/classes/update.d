module uim.modeller.controllers.actions.classes.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateClass : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateClass"));

  override void initialize() {
    super.initialize;

    this._initClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateClass"));
