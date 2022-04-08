module uim.modeller.views.components.forms.contents.entityclass;

@safe:
import uim.modeller;

class DMDLEntityClassFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLEntityClassFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["models", "packages", "modules", "mainTitle", "subTitle", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLEntityClassFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLEntityClassFormContent);
}}
