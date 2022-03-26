module uim.modeller.views.components.forms.contents.model;

@safe:
import uim.modeller;

class DMDLModelFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLModelFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLModelFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLModelFormContent);
}}
