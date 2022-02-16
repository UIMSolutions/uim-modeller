module uim.modeller.views.components.forms.bodies.entityclass;

@safe:
import uim.modeller;

class DMDLEntityClassFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLEntityClassFormBody", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLEntityClassFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLEntityClassFormBody);
}}
