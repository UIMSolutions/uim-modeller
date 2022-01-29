module uim.modeller.views.components.forms.groups.dataformat;

@safe:
import uim.modeller;

class DMDLDataFormatFormGroup : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLDataFormatFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_dataformat")
    .formName("entity_dataFormat")
    .fieldName("dataFormat")
    .label("Datenformat"); 
  }
}
mixin(APPFormComponentCalls!("MDLDataFormatFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}

