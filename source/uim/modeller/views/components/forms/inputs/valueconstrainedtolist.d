module uim.modeller.views.components.forms.inputs.valueconstrainedtolist;

@safe:
import uim.modeller;

class DMDLValueConstrainedToListFormInput : DSwitchFormInput {
  mixin(FormComponentThis!("MDLValueConstrainedToListFormInput", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_valueconstrainedtolist")
    .inputName("entity_valueConstrainedToList")
    .fieldName("valueConstrainedToList")
    .label("Value Constrained To List"); 
  }
}
mixin(FormComponentCalls!("MDLValueConstrainedToListFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
