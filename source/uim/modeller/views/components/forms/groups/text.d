module uim.modeller.views.components.forms.groups.text;

@safe:
import uim.modeller;

class DMDLFormGroupText : DAPPTextAreaFormGroup {
  mixin(APPFormComponentThis!("MDLFormGroupText", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_text")
    .name("entity_text")
    .fieldName("text")
    .label("Inhalt");
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupText", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
