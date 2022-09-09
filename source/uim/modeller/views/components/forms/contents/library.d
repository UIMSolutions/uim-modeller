module uim.modeller.views.components.forms.contents.library;

@safe:
import uim.modeller;

class DMDLLibraryFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLLibraryFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLLibraryFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLLibraryFormContent);
}}