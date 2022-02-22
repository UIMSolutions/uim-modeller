module uim.modeller.views.components.forms.bodies.app;

@safe:
import uim.modeller;

class DMDLAppFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLAppFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLAppFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAppFormBody);
}}