module uim.modeller.views.components.forms.bodies.entityclass;

@safe:
import uim.modeller;

class DMDLEntityClassFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLEntityClassFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["models", "packages", "modules", "mainTitle", "subTitle"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLEntityClassFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLEntityClassFormContent);
}}
