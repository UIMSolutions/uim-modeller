module uim.modeller.views.components.forms.inputs.summary;

@safe:
import uim.modeller;

class DMDLSummaryFormInput : DTextAreaFormInput {
  mixin(FormComponentThis!("MDLSummaryFormInput", true));

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
mixin(FormComponentCalls!("MDLSummaryFormInput", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}
