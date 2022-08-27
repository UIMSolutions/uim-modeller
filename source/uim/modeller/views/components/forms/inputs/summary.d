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

version(test_uim_modeller) { unittest {
  assert(MDLSummaryFormInput.id == "entity_summary");
  assert(MDLSummaryFormInput.name == "entity_summary");
  assert(MDLSummaryFormInput.inputName == "entity_summary");
  assert(MDLSummaryFormInput.fieldName == "summary");
  assert(MDLSummaryFormInput.label == "Zusammenfassung");
}}
