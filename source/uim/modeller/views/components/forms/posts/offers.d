module uim.modeller.views.components.forms.posts.offers;

@safe:
import uim.modeller;
// import models.cms.entities.offer;

class DMDLOfferForm : DMDLPostForm {
  mixin(APPFormThis!("MDLOfferForm", true));

  override void initialize() { 
    super.initialize; 
    
    this
    .formBody(MDLOfferFormBody);
  }
}
mixin(APPFormCalls!("MDLOfferForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}