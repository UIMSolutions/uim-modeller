module uim.modeller.views.components.forms.contents.function_;

@safe:
import uim.modeller;

class DMDLFunctionFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLFunctionFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLFunctionFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLFunctionFormContent);
}}
