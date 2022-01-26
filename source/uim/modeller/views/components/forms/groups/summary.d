module uim.modeller.views.components.forms.groups.summary;

@safe:
import uim.modeller;

class DMDLFormGroupSummary : DAPPTextAreaFormGroup {
  mixin(APPFormComponentThis!("MDLFormGroupSummary", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_summary")
    .name("entity_summary")
    .fieldName("summary")
    .label("Zusammenfassung") 
    .fieldName("summary"); 
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupSummary", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
