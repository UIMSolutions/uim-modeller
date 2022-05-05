module uim.modeller.views.components.forms.contents.interface_;

@safe:
import uim.modeller;

class DMDLInterfaceFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLInterfaceFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["mainTitle", "subTitle", "packages", "modules", "github", "summary", "text"])
      .inputHandler(MDLFormInputHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLInterfaceFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLInterfaceFormContent);
}}
