module uim.modeller.controllers.actions.packages.update;

@safe:
import uim.modeller;

class DMDLAction_UpdatePackage : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdatePackage"));

  override void initialize() {
    super.initialize;

    this._initPackagesAction;
  }
}
mixin(APPControllerCalls!("MDLAction_UpdatePackage"));
