module uim.modeller.views.components.forms.inputs.isarray;

@safe:
import uim.modeller;

class DMDLIsArrayFormInput : DSwitchFormInput {
  mixin(FormComponentThis!("MDLIsArrayFormInput", true));  // not MDLIsArrayFormInput!

  override void initialize() {
    super.initialize;

    this
    .id("entity_isarray")
    .inputName("entity_isArray")
    .fieldName("isArray")
    .label("Datenformat Array"); 
  }
}
mixin(FormComponentCalls!("MDLIsArrayFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
