module uim.modeller.views.components.forms.bodies.page;

@safe:
import uim.modeller;

class DMDLPageFormBody : DMDLPostFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", /* "themes", */ "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLPageFormBody() { return new DMDLPageFormBody; } 
auto MDLPageFormBody(DAPPForm myForm) { return new DMDLPageFormBody(myForm); } 
auto MDLPageFormBody(DOOPEntity myEntity) { return new DMDLPageFormBody(myEntity); } 
auto MDLPageFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLPageFormBody(myForm, myEntity); } 

version(test_uim_modeller) {
  unittest {
    assert(MDLPageFormBody);
}}
