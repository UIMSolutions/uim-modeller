module uim.modeller.views.components.forms.contents.control;

@safe:
import uim.modeller;

class DMDLControlFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLControlFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["github", "summary", "text", "controlcategory"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLControlFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLControlFormContent);
}}
