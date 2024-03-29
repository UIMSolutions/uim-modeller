module uim.modeller.views.components.forms.inputs.text;

@safe:
import uim.modeller;

class DMDLTextFormInput : DTextAreaFormInput {
  mixin(ViewComponentThis!("MDLTextFormInput", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_text")
    .name("entity_text")
    .inputName("entity_text")
    .fieldName("text")
    .label("Inhalt");
  }
}
mixin(ViewComponentCalls!("MDLTextFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
