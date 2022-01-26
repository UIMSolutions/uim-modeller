module uim.modeller.views.components.forms.groups.image;

@safe:
import uim.modeller;

class DMDLFormGroupImage : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLFormGroupImage", true));
  
  override void initialize() {
    super.initialize;

    this
    .id("entity_imagepath")
    .name("entity_imagepath")
    .fieldName("imagePath")
    .label("Titelbild"); 
  }
}
mixin(APPFormComponentCalls!("MDLFormGroupImage", true));

version(test_uim_cms) {
  unittest {
    // assert(MDLFormGroupImage);
}}