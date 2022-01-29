module uim.modeller.views.components.forms.groups.isbig;

@safe:
import uim.modeller;

class DMDLIsBigFormGroup : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("MDLIsBigFormGroup", true));  

  override void initialize() {
    super.initialize;

    this
    .id("entity_isbig")
    .formName("entity_isBig")
    .fieldName("isBig")
    .label("Datenformat Big"); 
  }
}
mixin(APPFormComponentCalls!("MDLIsBigFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
