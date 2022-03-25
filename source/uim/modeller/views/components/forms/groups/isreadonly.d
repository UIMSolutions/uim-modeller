module uim.modeller.views.components.forms.groups.isreadonly;

@safe:
import uim.modeller;

class DMDLIsReadOnlyFormGroup : DAPPSwitchFormGroup {
  mixin(FormComponentThis!("MDLIsReadOnlyFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isreadonly")
    .inputName("entity_isReadOnly")
    .fieldName("isReadOnly")
    .label("Datenformat ReadOnly"); 
  }
}
mixin(FormComponentCalls!("MDLIsReadOnlyFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
