module uim.modeller.views.components.forms.groups.subtitle;

@safe:
import uim.modeller;

class DMDLFormGroupSubTitle : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLFormGroupSubTitle", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_subTitle")
    .name("entity_subTitle")
    .fieldName("subTitle")
    .label("Untertitel"); 
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupSubTitle", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}

