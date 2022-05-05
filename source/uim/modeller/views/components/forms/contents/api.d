module uim.modeller.views.components.forms.contents.api;

@safe:
import uim.modeller;

class DMDLApiFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLApiFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLApiFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLApiFormContent);
}}