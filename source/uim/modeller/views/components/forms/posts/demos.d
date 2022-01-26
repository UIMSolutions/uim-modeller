module uim.modeller.views.components.forms.posts.demos;

@safe:
import uim.modeller;
// import models.cms.entities.demo;

class DMDLDemoForm : DMDLPostForm {
  mixin(APPFormThis!("MDLDemoForm", true));

  override void initialize() {
    super.initialize;

    this
    .formBody(MDLDemoFormBody);
  }
}
mixin(APPFormCalls!("MDLDemoForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}
