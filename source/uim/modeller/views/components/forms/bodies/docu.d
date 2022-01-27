module uim.modeller.views.components.forms.bodies.docu;

@safe:
import uim.modeller;

class DMDLDocuFormBody : DMDLPostFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Create)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLDocuFormBody() { return new DMDLDocuFormBody; }
auto MDLDocuFormBody(DAPPForm myForm) { return new DMDLDocuFormBody(myForm); }
auto MDLDocuFormBody(DOOPEntity myEntity) { return new DMDLDocuFormBody(myEntity); }
auto MDLDocuFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLDocuFormBody(myForm, myEntity); }

version(test_uim_modeller) {
  unittest {
    assert(MDLDocuFormBody);
}}