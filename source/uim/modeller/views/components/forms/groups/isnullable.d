module uim.modeller.views.components.forms.groups.isnullable;

@safe:
import uim.modeller;

class DMDLIsNullableFormGroup : DAPPSwitchFormGroup {
  mixin(FormComponentThis!("MDLIsNullableFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isnullable")
    .inputName("entity_isNullable")
    .fieldName("isNullable")
    .label("Datenformat Nullable"); 
  }
}
mixin(FormComponentCalls!("MDLIsNullableFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
