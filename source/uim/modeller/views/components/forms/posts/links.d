module uim.modeller.views.components.forms.posts.links;

@safe:
import uim.modeller;
// import models.cms.entities.link;

class DMDLLinkForm : DMDLPostForm {
  mixin(APPFormThis!("MDLLinkForm", true));
  
  override void initialize() { 
    super.initialize; 
  
    this
    .formBody(MDLLinkFormBody);
  }
}
mixin(APPFormCalls!("MDLLinkForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}