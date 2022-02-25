module uim.modeller.views.components.forms.bodies.package_;

@safe:
import uim.modeller;

class DMDLPackageFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLPackageFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLPackageFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLPackageFormBody);
}}