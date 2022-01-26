module uim.modeller.views.components.forms.bodies.news;

@safe:
import uim.modeller;

class DMDLNewsItemFormBody : DMDLPostFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Create)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLNewsItemFormBody() { return new DMDLNewsItemFormBody; }
auto MDLNewsItemFormBody(DAPPForm myForm) { return new DMDLNewsItemFormBody(myForm); }
auto MDLNewsItemFormBody(DOOPEntity myEntity) { return new DMDLNewsItemFormBody(myEntity); }
auto MDLNewsItemFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLNewsItemFormBody(myForm, myEntity); }

version(test_uim_cms) {
  unittest {
    assert(MDLNewsItemFormBody);
  }
}
