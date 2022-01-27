module uim.modeller.views.components.forms.bodies.glossary;

@safe:
import uim.modeller;

class DMDLGlossaryItemFormBody : DMDLPostFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Create)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLGlossaryItemFormBody() { return new DMDLGlossaryItemFormBody; }
auto MDLGlossaryItemFormBody(DAPPForm myForm) { return new DMDLGlossaryItemFormBody(myForm); }
auto MDLGlossaryItemFormBody(DOOPEntity myEntity) { return new DMDLGlossaryItemFormBody(myEntity); }
auto MDLGlossaryItemFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLGlossaryItemFormBody(myForm, myEntity); }

version(test_uim_modeller) {
  unittest {
    assert(MDLGlossaryItemFormBody);
}}