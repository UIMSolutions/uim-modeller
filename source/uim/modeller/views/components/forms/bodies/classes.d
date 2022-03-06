module source.uim.modeller.views.components.forms.bodies.classes;

@safe:
import uim.modeller;

class DMDLAppFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLAppFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLAppFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAppFormBody);
}}