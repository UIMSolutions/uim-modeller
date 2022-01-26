module uim.modeller.views.components.forms.bodies.demo;

@safe:
import uim.modeller;

class DMDLDemoFormBody : DMDLPostFormBody {
  this() { super();
    this
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLDemoFormBody() { return new DMDLDemoFormBody; }
auto MDLDemoFormBody(DAPPForm myForm) { return new DMDLDemoFormBody(myForm); }
auto MDLDemoFormBody(DOOPEntity myEntity) { return new DMDLDemoFormBody(myEntity); }
auto MDLDemoFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLDemoFormBody(myForm, myEntity); }

version(test_uim_cms) {
  unittest {
    assert(MDLDemoFormBody);
}}