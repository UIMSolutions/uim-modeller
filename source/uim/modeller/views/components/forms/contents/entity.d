module uim.modeller.views.components.forms.contents.entity;

@safe:
import uim.modeller;

class DMDLEntityFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLEntityFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "models", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLEntityFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLEntityFormContent);
}}
