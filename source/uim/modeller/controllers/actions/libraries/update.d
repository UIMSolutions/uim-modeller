module uim.modeller.controllers.actions.libraries.update;

@safe:
import uim.modeller;

class DMDLAction_UpdateLibrary : DMDLUpdateAction {
  mixin(APPControllerThis!("MDLAction_UpdateLibrary"));

  override void initialize() {
    super.initialize;

    this._initLibrariesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_UpdateLibrary"));
