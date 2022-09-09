module uim.modeller.views.components.forms.contents.module_;

@safe:
import uim.modeller;

class DMDLModuleFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLModuleFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["mainTitle", "subTitle", "libraries", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLModuleFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLModuleFormContent);
}}