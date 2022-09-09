module uim.modeller.views.components.forms.inputs.imagepath;

@safe:
import uim.modeller;

class DMDLImagePathFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLImagePathFormInput", true));
  
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
mixin(ViewComponentCalls!("MDLImagePathFormInput", true));

version(test_uim_modeller) { unittest {
    assert(MDLImagePathFormInput);
}}