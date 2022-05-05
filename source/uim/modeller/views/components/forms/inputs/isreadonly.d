module uim.modeller.views.components.forms.inputs.isreadonly;

@safe:
import uim.modeller;

class DMDLIsReadOnlyFormInput : DSwitchFormInput {
  mixin(FormComponentThis!("MDLIsReadOnlyFormInput", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isreadonly")
    .inputName("entity_isReadOnly")
    .fieldName("isReadOnly")
    .label("Datenformat ReadOnly"); 
  }
}
mixin(FormComponentCalls!("MDLIsReadOnlyFormInput", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
