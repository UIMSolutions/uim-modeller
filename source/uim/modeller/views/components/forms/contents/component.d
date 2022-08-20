module uim.modeller.views.components.forms.contents.component;

@safe:
import uim.modeller;

class DMDLComponentFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLComponentFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLComponentFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLComponentFormContent);
}}
