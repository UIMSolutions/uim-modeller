module uim.modeller.views.components.forms.groups.isreadonly;

@safe:
import uim.modeller;

class DMDLIsReadOnlyFormGroup : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("MDLIsReadOnlyFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isreadonly")
    .formName("entity_isReadOnly")
    .fieldName("isReadOnly")
    .label("Datenformat ReadOnly"); 
  }
}
mixin(APPFormComponentCalls!("MDLIsReadOnlyFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
