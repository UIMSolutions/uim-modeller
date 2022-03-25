module uim.modeller.views.components.forms.bodies.api;

@safe:
import uim.modeller;

class DMDLApiFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLApiFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLApiFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLApiFormContent);
}}