module uim.modeller.controls.tabs.panes.packages;

@safe:
import uim.controls;

class DMDLPackagesPaneControl : DUIMTabPaneControl {
  mixin(ControlThis!("MDLPackagesPane"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) { 
      super.beforeH5(options);
  }
}
mixin(ControlCalls!("MDLPackagesPaneControl", "DMDLPackagesPaneControl"));
mixin(ControlCalls!("MDLPackagesPane", "DMDLPackagesPaneControl"));

version(test_uim_controls) { unittest {
    assert(MDLPackagesPane);
}}