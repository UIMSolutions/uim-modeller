module uim.modeller.controls.tabs.panes.properties;

@safe:
import uim.controls;

class DMDLPropertiesPaneControl : DUIMTabPaneControl {
  mixin(ControlThis!("MDLPropertiesPane"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) { 
      super.beforeH5(options);
  }
}
mixin(ControlCalls!("MDLPropertiesPaneControl", "DMDLPropertiesPaneControl"));
mixin(ControlCalls!("MDLPropertiesPane", "DMDLPropertiesPaneControl"));

version(test_uim_controls) { unittest {
    assert(MDLPropertiesPane);
}}