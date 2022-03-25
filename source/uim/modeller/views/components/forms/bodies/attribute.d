module uim.modeller.views.components.forms.bodies.attribute;

@safe:
import uim.modeller;

class DMDLAttributeFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLAttributeFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist","packages", "modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLAttributeFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAttributeFormContent);
}}