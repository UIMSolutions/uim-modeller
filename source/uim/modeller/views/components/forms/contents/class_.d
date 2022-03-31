module uim.modeller.views.components.forms.contents.class_;

@safe:
import uim.modeller;

class DMDLClassFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLClassFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["modules", "github", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLClassFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLClassFormContent);
}}