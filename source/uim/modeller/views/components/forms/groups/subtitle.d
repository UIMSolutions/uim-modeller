module uim.modeller.views.components.forms.groups.subtitle;

@safe:
import uim.modeller;

class DMDLSubTitleFormGroup : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLSubTitleFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_subTitle")
    .name("entity_subTitle")
    .inputName("entity_subTitle")
    .fieldName("subTitle")
    .label("Untertitle"); 
  }
}
mixin(APPFormComponentCalls!("MDLSubTitleFormGroup", true));

version(test_uim_modeller) {
  unittest {
    assert(new DMDLSubTitleFormGroup);
    assert(MDLSubTitleFormGroup);
}}