module uim.modeller.controllers.actions.libraries.delete_;

@safe:
import uim.modeller;

class DMDLAction_DeleteLibrary : DMDLDeleteAction {
  mixin(APPControllerThis!("MDLAction_DeleteLibrary"));

  override void initialize() {
    super.initialize;

    this._initLibrariesAction; 
  }
}
mixin(APPControllerCalls!("MDLAction_DeleteLibrary"));
