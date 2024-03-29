module uim.modeller.views.components.forms.contents.control;

@safe:
import uim.modeller;

class DMDLControlFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLControlFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["controlcategory", "mainTitle", "subTitle", "github", "imagePath", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLControlFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLControlFormContent);
}}
