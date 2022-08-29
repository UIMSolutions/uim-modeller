module uim.modeller.controls.tabs.panes.attributes;

module uim.controls.tabs.panes.pane;

@safe:
import uim.controls;

class DMDLAttributesPaneControl : DUIMTabPaneControl {
  mixin(ControlThis!("MDLAttributesPane"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) { 
      super.beforeH5(options);
  }
}
mixin(ControlCalls!("MDLAttributesPaneControl", "DMDLAttributesPaneControl"));
mixin(ControlCalls!("MDLAttributesPane", "DMDLAttributesPaneControl"));

version(test_uim_controls) { unittest {
    assert(MDLAttributesPane);
}}
