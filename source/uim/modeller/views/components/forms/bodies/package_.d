module uim.modeller.views.components.forms.bodies.package_;

@safe:
import uim.modeller;

class DMDLPackageFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLPackageFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "github", "packages", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLPackageFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLPackageFormContent);
}}