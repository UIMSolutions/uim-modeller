module uim.modeller.views.components.forms.inputs.dataformat;

@safe:
import uim.modeller;

class DMDLDataFormatFormInput : DTextFormInput {
  mixin(FormComponentThis!("MDLDataFormatFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_dataformat")
    .inputName("entity_dataFormat")
    .fieldName("dataFormat")
    .label("Datenformat"); 
  }
}
mixin(FormComponentCalls!("MDLDataFormatFormInput", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}

