module uim.modeller.views.components.forms.inputs.classname;

@safe:
import uim.modeller;

class DMDLClassNameFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLClassNameFormInput", true));

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
mixin(ViewComponentCalls!("MDLClassNameFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}