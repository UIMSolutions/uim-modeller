module uim.modeller.controllers.actions.entityclasses.create;

@safe:
import uim.modeller;

class DMDLAction_CreateEntityClass : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateEntityClass"));

  override void initialize() {
    super.initialize;

    this._initEntityClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateEntityClass"));
