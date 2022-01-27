module uim.modeller.views.components.forms.posts.glossary;

@safe:
import uim.modeller;
// import models.modeller.entities.glossary_item;

class DMDLGlossaryItemForm : DMDLPostForm {
  mixin(APPFormThis!("MDLGlossaryItemForm", true));

  override void initialize() { 
    super.initialize; 

    this
    .formBody(MDLGlossaryItemFormBody);
  }
}
mixin(APPFormCalls!("MDLGlossaryItemForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}