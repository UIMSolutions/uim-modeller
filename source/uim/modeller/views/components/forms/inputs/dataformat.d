module uim.modeller.views.components.forms.inputs.dataformat;

@safe:
import uim.modeller;

class DMDLDataFormatFormGroup : DAPPTextFormGroup {
  mixin(FormComponentThis!("MDLDataFormatFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_dataformat")
    .inputName("entity_dataFormat")
    .fieldName("dataFormat")
    .label("Datenformat"); 
  }
}
mixin(FormComponentCalls!("MDLDataFormatFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}

