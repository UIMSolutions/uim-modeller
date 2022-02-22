module uim.modeller.views.components.forms.bodies.function_;

@safe:
import uim.modeller;

class DMDLFunctionFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLFunctionFormBody", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle"])
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLFunctionFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLFunctionFormBody);
}}
