module uim.modeller.views.components.forms.bodies.api;

@safe:
import uim.modeller;

class DMDLApiFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLApiFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLApiFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLApiFormBody);
}}