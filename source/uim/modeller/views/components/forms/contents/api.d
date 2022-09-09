module uim.modeller.views.components.forms.contents.api;

@safe:
import uim.modeller;

class DMDLApiFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLApiFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist", "summary", "text"])
      .inputHandler(
        MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLApiFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLApiFormContent);
}}