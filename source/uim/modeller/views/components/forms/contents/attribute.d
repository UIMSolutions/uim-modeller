module uim.modeller.views.components.forms.contents.attribute;

@safe:
import uim.modeller;

class DMDLAttributeFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLAttributeFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist","packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLAttributeFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeFormContent);
}}