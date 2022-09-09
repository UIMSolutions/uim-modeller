module uim.modeller.views.components.forms.contents.attribute;

@safe:
import uim.modeller;

class DMDLAttributeFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLAttributeFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["attributes", "libraries", "isnullable", "isreadonly", "dataformat", "valueconstrainedtolist","packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLAttributeFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLAttributeFormContent);
}}