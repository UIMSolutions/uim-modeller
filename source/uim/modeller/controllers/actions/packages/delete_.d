module uim.modeller.controllers.actions.packages.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeletePackage : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeletePackage"));

  override void initialize() {
    super.initialize;

    this._initPackagesAction;
  }
}
mixin(APPControllerCalls!("MDLAction_DeletePackage"));
