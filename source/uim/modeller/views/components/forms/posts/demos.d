module uim.modeller.views.components.forms.posts.demos;

@safe:
import uim.modeller;
// import models.modeller.entities.demo;

class DMDLDemoForm : DMDLPostForm {
  mixin(APPFormThis!("MDLDemoForm", true));

  override void initialize() {
    super.initialize;

    this
    .formBody(MDLDemoFormBody);
  }
}
mixin(APPFormCalls!("MDLDemoForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}
