module uim.modeller.views.components.forms.contents.attributeclass;

@safe:
import uim.modeller;

class DMDLAttributeClassFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLAttributeClassFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "models", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLAttributeClassFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeClassFormContent);
}}