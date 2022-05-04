module uim.modeller.views.components.forms.inputs.isarray;

@safe:
import uim.modeller;

class DMDLIsArrayFormGroup : DAPPSwitchFormGroup {
  mixin(FormComponentThis!("MDLIsArrayFormGroup", true));  // not MDLIsArrayFormGroup!

  override void initialize() {
    super.initialize;

    this
    .id("entity_isarray")
    .inputName("entity_isArray")
    .fieldName("isArray")
    .label("Datenformat Array"); 
  }
}
mixin(FormComponentCalls!("MDLIsArrayFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
