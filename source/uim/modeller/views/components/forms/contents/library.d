module uim.modeller.views.components.forms.contents.library;

@safe:
import uim.modeller;

class DMDLLibraryFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLLibraryFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLLibraryFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLLibraryFormContent);
}}