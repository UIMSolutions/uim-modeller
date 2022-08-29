module uim.modeller.controls.tabs.panes.modules;

@safe:
import uim.controls;

class DMDLModulesPaneControl : DUIMTabPaneControl {
  mixin(ControlThis!("MDLModulesPane"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) { 
      super.beforeH5(options);
  }
}
mixin(ControlCalls!("MDLModulesPaneControl", "DMDLModulesPaneControl"));
mixin(ControlCalls!("MDLModulesPane", "DMDLModulesPaneControl"));

version(test_uim_controls) { unittest {
    assert(MDLModulesPane);
}}
