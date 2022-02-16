module uim.modeller.views.components.forms.groups.valueconstrainedtolist;

@safe:
import uim.modeller;

class DMDLValueConstrainedToListFormGroup : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("MDLValueConstrainedToListFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_valueconstrainedtolist")
    .formName("entity_valueConstrainedToList")
    .fieldName("valueConstrainedToList")
    .label("Value Constrained To List"); 
  }
}
mixin(APPFormComponentCalls!("MDLValueConstrainedToListFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
