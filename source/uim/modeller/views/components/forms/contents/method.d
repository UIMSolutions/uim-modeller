module uim.modeller.views.components.forms.contents.method;

@safe:
import uim.modeller;

class DMDLMethodFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLMethodFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLMethodFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLMethodFormContent);
}}