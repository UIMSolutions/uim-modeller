module uim.modeller.views.components.forms.bodies.attributeclass;

@safe:
import uim.modeller;

class DMDLAttributeClassFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLAttributeClassFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "models", "packages", "modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLAttributeClassFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeClassFormContent);
}}