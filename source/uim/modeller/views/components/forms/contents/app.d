module uim.modeller.views.components.forms.contents.app;

@safe:
import uim.modeller;

class DMDLAppFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLAppFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLAppFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLAppFormContent);
}}