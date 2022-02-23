module uim.modeller.views.components.forms.bodies.method;

@safe:
import uim.modeller;

class DMDLMethodFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLMethodFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLMethodFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLMethodFormBody);
}}