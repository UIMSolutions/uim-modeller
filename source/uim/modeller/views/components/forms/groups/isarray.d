module uim.modeller.views.components.forms.groups.isarray;

@safe:
import uim.modeller;

class DMDLIsArrayFormGroup : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("MDLIsArrayFormGroup", true));  // not MDLIsArrayFormGroup!

  override void initialize() {
    super.initialize;

    this
    .id("entity_isarray")
    .formName("entity_isArray")
    .fieldName("isArray")
    .label("Datenformat Array"); 
  }
}
mixin(APPFormComponentCalls!("MDLIsArrayFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
