module uim.modeller.controllers.actions.libraries.create;

@safe:
import uim.modeller;

class DMDLAction_CreateLibrary : DMDLCreateAction {
  mixin(APPControllerThis!("MDLAction_CreateLibrary"));

  override void initialize() {
    super.initialize;

    this._initLibrariesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_CreateLibrary"));
