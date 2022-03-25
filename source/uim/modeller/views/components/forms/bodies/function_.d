module uim.modeller.views.components.forms.bodies.function_;

@safe:
import uim.modeller;

class DMDLFunctionFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLFunctionFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLFunctionFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLFunctionFormContent);
}}
