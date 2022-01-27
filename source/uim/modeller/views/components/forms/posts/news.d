module uim.modeller.views.components.forms.posts.news;

@safe:
import uim.modeller;
// import models.cms.entities.news;

class DMDLNewsItemForm : DMDLPostForm {
  mixin(APPFormThis!("MDLNewsItemForm", true));

  override void initialize() { 
    super.initialize; 

    this
    .formBody(MDLNewsItemFormBody);
  }
}
mixin(APPFormCalls!("MDLNewsItemForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}