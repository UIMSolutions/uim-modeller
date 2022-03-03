module uim.modeller.controllers.actions.packages.create;

@safe:
import uim.modeller;

class DMDLAction_CreatePackage : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreatePackage"));

  override void initialize() {
    super.initialize;

    this
    .rootPath("/modeller/packages") 
    .collectionName("modeller_packages"); 
  }
}
mixin(APPControllerCalls!("MDLAction_CreatePackage"));
