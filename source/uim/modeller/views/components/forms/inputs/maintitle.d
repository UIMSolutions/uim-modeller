module uim.modeller.views.components.forms.inputs.maintitle;

@safe:
import uim.modeller;

class DMDLMainTitleFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLMainTitleFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle")
    .inputName("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(ViewComponentCalls!("MDLMainTitleFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}