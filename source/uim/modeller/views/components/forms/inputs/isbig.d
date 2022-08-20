module uim.modeller.views.components.forms.inputs.isbig;

@safe:
import uim.modeller;

class DMDLIsBigFormInput : DSwitchFormInput {
  mixin(FormComponentThis!("MDLIsBigFormInput", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isbig")
    .inputName("entity_isBig")
    .fieldName("isBig")
    .label("Datenformat Big"); 
  }
}
mixin(FormComponentCalls!("MDLIsBigFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
