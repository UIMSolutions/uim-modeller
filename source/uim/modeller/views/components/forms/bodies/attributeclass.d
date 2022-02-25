module uim.modeller.views.components.forms.bodies.attributeclass;

@safe:
import uim.modeller;

class DMDLAttributeClassFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLAttributeClassFormBody", true));

  override void initialize() {
    super.initialize;

    this
      .addFields([])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLAttributeClassFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeClassFormBody);
}}