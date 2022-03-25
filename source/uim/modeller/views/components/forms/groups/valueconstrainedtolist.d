module uim.modeller.views.components.forms.groups.valueconstrainedtolist;

@safe:
import uim.modeller;

class DMDLValueConstrainedToListFormGroup : DAPPSwitchFormGroup {
  mixin(FormComponentThis!("MDLValueConstrainedToListFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_valueconstrainedtolist")
    .inputName("entity_valueConstrainedToList")
    .fieldName("valueConstrainedToList")
    .label("Value Constrained To List"); 
  }
}
mixin(FormComponentCalls!("MDLValueConstrainedToListFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
