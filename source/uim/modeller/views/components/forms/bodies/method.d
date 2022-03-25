module uim.modeller.views.components.forms.bodies.method;

@safe:
import uim.modeller;

class DMDLMethodFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLMethodFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLMethodFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLMethodFormContent);
}}