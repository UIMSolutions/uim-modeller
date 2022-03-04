module uim.modeller.controllers.actions.entityclasses.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteEntityClass : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteEntityClass"));

  override void initialize() {
    super.initialize;

    this._initEntityClassesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteEntityClass"));
