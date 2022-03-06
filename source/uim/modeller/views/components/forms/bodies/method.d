module uim.modeller.views.components.forms.bodies.method;

@safe:
import uim.modeller;

class DMDLMethodFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLMethodFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLMethodFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLMethodFormBody);
}}