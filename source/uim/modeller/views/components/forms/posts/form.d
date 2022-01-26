module uim.modeller.views.components.forms.posts.form;

@safe:
import uim.modeller;

class DMDLPostForm : DMDLForm {
  mixin(APPFormThis!("MDLPostForm", true));

  override void initialize() { 
    super.initialize; 
    
    this
    .formBody(MDLPostFormBody);
  }

  mixin(OProperty!("DOOPEntity[]", "themes"));
}
mixin(APPFormCalls!("MDLPostForm", true));

version(test_uim_cms) {
  unittest {
    // TODO
}}