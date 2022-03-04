module uim.modeller.controllers.actions.entityclasses.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateEntityClass : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateEntityClass"));

  override void initialize() {
    super.initialize;

    this._initEntityClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateEntityClass"));
