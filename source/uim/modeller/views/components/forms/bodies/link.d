module uim.modeller.views.components.forms.bodies.link;

@safe:
import uim.modeller;

class DMDLLinkFormBody : DMDLPostFormBody {
  this() { super();
    this
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLLinkFormBody() { return new DMDLLinkFormBody; }
auto MDLLinkFormBody(DAPPForm myForm) { return new DMDLLinkFormBody(myForm); }
auto MDLLinkFormBody(DOOPEntity myEntity) { return new DMDLLinkFormBody(myEntity); }
auto MDLLinkFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLLinkFormBody(myForm, myEntity); }

version(test_uim_cms) {
  unittest {
    assert(MDLLinkFormBody);
}}
