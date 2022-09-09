module uim.modeller.views.components.forms.inputs.subtitle;

@safe:
import uim.modeller;

class DMDLSubTitleFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLSubTitleFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_subTitle")
    .name("entity_subTitle")
    .inputName("entity_subTitle")
    .fieldName("subTitle")
    .label("Untertitle"); 
  }
}
mixin(ViewComponentCalls!("MDLSubTitleFormInput", true));

version(test_uim_modeller) { unittest {
    assert(new DMDLSubTitleFormInput);
    assert(MDLSubTitleFormInput);
}}