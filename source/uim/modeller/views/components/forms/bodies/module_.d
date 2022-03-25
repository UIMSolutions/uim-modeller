module uim.modeller.views.components.forms.bodies.module_;

@safe:
import uim.modeller;

class DMDLModuleFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLModuleFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLModuleFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLModuleFormContent);
}}