module uim.modeller.views.components.forms.bodies.offer;

@safe:
import uim.modeller;

class DMDLOfferFormBody : DMDLPostFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Create)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }
}
auto MDLOfferFormBody() { return new DMDLOfferFormBody; }
auto MDLOfferFormBody(DAPPForm myForm) { return new DMDLOfferFormBody(myForm); }
auto MDLOfferFormBody(DOOPEntity myEntity) { return new DMDLOfferFormBody(myEntity); }
auto MDLOfferFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLOfferFormBody(myForm, myEntity); }

version(test_uim_modeller) {
  unittest {
   assert(MDLOfferFormBody);
}}