module uim.modeller.views.components.forms.inputs.isnullable;

@safe:
import uim.modeller;

class DMDLIsNullableFormInput : DSwitchFormInput {
  mixin(ViewComponentThis!("MDLIsNullableFormInput", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isnullable")
    .inputName("entity_isNullable")
    .fieldName("isNullable")
    .label("Nullable"); 
  }
}
mixin(ViewComponentCalls!("MDLIsNullableFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
