module uim.modeller.views.components.forms.bodies.entityclass;

@safe:
import uim.modeller;

class DMDLEntityClassFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLEntityClassFormBody", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["models", "mainTitle", "subTitle"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(APPFormComponentCalls!("MDLEntityClassFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLEntityClassFormBody);
}}
