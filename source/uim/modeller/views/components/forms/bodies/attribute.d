module uim.modeller.views.components.forms.bodies.attribute;

@safe:
import uim.modeller;

class DMDLAttributeFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLAttributeFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLAttributeFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeFormBody);
}}