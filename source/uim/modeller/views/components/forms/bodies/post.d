module uim.modeller.views.components.forms.bodies.post;

@safe:
import uim.modeller;

class DMDLPostFormBody : DAPPEntityFormBody {
  this() { super(); 
    this
    .crudMode(CRUDModes.Read)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (entity) {
      switch(field) {
        case "private": return MDLFormGroupPrivate(form).entity(entity).toH5(options);
        case "maintitle": return MDLFormGroupMainTitle(form).entity(entity).toH5(options);
        case "subtitle": return MDLFormGroupSubTitle(form).entity(entity).toH5(options);
        case "keywords": return MDLFormGroupKeywords(form).entity(entity).toH5(options);
        case "image": return MDLFormGroupImage(form).entity(entity).toH5(options);
        case "summary": return MDLFormGroupSummary(form).entity(entity).toH5(options);
        case "text": return MDLFormGroupText(form).entity(entity).toH5(options);
        case "themes": return MDLFormGroupTheme(form).entity(entity).toH5(options);
        default: return super.formGroup(field, readonly, options); // get previous defined formgroups
    }}
    return null;
  }
}
auto MDLPostFormBody() { return new DMDLPostFormBody; } 
auto MDLPostFormBody(DAPPForm myForm) { return new DMDLPostFormBody(myForm); } 
auto MDLPostFormBody(DOOPEntity myEntity) { return new DMDLPostFormBody(myEntity); } 
auto MDLPostFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLPostFormBody(myForm, myEntity); } 