module uim.modeller.views.components.forms.groups.classname;

@safe:
import uim.modeller;

class DMDLClassNameFormGroup : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLClassNameFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_className")
    .name("entity_className")
    .inputName("entity_className")
    .fieldName("className")
    .label("Klassenname"); 
  }
}
mixin(APPFormComponentCalls!("MDLClassNameFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}