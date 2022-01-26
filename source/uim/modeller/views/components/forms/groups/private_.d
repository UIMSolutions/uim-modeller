module uim.modeller.views.components.forms.groups.private_;

@safe:
import uim.modeller;

class DMDLFormGroupPrivate : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("entity_private"));  // not MDLFormGroupPrivate!
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize;

    this
    .id("entity_private")
    .fieldName("isPrivate")
    .label("Privat"); 
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupPrivate"));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
