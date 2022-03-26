module uim.modeller.views.components.forms.contents.package_;

@safe:
import uim.modeller;

class DMDLPackageFormContent : DEntityFormContent {
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