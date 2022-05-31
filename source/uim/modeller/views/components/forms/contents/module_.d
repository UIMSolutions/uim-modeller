module uim.modeller.views.components.forms.contents.module_;

@safe:
import uim.modeller;

class DMDLModuleFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLModuleFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "libraries", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLModuleFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLModuleFormContent);
}}