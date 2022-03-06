module uim.modeller.views.components.forms.bodies.module_;

@safe:
import uim.modeller;

class DMDLModuleFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLModuleFormBody", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLModuleFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLModuleFormBody);
}}