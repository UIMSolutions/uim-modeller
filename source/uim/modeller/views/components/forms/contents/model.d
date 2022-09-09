module uim.modeller.views.components.forms.contents.model;

@safe:
import uim.modeller;

class DMDLModelFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLModelFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLModelFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLModelFormContent);
}}
