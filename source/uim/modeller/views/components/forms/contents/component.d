module uim.modeller.views.components.forms.contents.component;

@safe:
import uim.modeller;

class DMDLComponentFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLComponentFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLComponentFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLComponentFormContent);
}}
