module uim.modeller.views.components.forms.groups.maintitle;

@safe:
import uim.modeller;

class DMDLFormGroupMainTitle : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLFormGroupMainTitle", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupMainTitle", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}