module uim.modeller.views.components.forms.inputs.isbig;

@safe:
import uim.modeller;

class DMDLIsBigFormInput : DSwitchFormInput {
  mixin(ViewComponentThis!("MDLIsBigFormInput", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isbig")
    .inputName("entity_isBig")
    .fieldName("isBig")
    .label("Datenformat Big"); 
  }
}
mixin(ViewComponentCalls!("MDLIsBigFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
