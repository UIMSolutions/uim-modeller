module uim.modeller.views.components.forms.contents.class_;

@safe:
import uim.modeller;

class DMDLClassFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLClassFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLClassFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLClassFormContent);
}}