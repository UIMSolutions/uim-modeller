module uim.modeller.views.components.forms.groups.maintitle;

@safe:
import uim.modeller;

class DMDLMainTitleFormGroup : DAPPTextFormGroup {
  mixin(FormComponentThis!("MDLMainTitleFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle")
    .inputName("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(FormComponentCalls!("MDLMainTitleFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}