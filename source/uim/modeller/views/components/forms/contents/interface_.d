module uim.modeller.views.components.forms.contents.interface_;

@safe:
import uim.modeller;

class DMDLInterfaceFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("MDLInterfaceFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "libraries", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler); 
  }
}
mixin(ViewComponentCalls!("MDLInterfaceFormContent", true));

version(test_uim_modeller) { unittest {
    assert(MDLInterfaceFormContent);
}}
