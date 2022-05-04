module uim.modeller.views.components.forms.inputs.summary;

@safe:
import uim.modeller;

class DMDLSummaryFormGroup : DAPPTextAreaFormGroup {
  mixin(FormComponentThis!("MDLSummaryFormGroup", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_summary")
    .name("entity_summary")
    .inputName("entity_summary")
    .fieldName("summary")
    .label("Zusammenfassung"); 
  }
}
mixin(FormComponentCalls!("MDLSummaryFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
