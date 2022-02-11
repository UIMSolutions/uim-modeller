module uim.modeller.views.components.forms.bodies.package_;

@safe:
import uim.modeller;

class DMDLPackageFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLPackageFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLPackageFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLDemoFormBody);
}}