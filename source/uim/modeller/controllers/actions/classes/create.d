module uim.modeller.controllers.actions.classes.create;

@safe:
import uim.modeller;

class DMDLAction_CreateClass : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateClass"));

  override void initialize() {
    super.initialize;

    this._initClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateClass"));
