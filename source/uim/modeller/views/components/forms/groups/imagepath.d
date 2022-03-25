module uim.modeller.views.components.forms.groups.imagepath;

@safe:
import uim.modeller;

class DMDLImagePathFormGroup : DAPPTextFormGroup {
  mixin(FormComponentThis!("MDLImagePathFormGroup", true));
  
  override void initialize() {
    super.initialize;

    this
    .id("entity_imagePath")
    .name("entity_imagePath")
    .fieldName("imagePath")
    .inputName("entity_imagePath")
    .label("Titelbild"); 
  }
}
mixin(FormComponentCalls!("MDLImagePathFormGroup", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLImagePathFormGroup);
}}