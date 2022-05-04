module uim.modeller.views.components.forms.inputs.classname;

@safe:
import uim.modeller;

class DMDLClassNameFormGroup : DAPPTextFormGroup {
  mixin(FormComponentThis!("MDLClassNameFormGroup", true));

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
mixin(FormComponentCalls!("MDLClassNameFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}