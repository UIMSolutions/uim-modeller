module uim.modeller.views.components.forms.bodies.library;

@safe:
import uim.modeller;

class DMDLLibraryFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLLibraryFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLLibraryFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLLibraryFormBody);
}}