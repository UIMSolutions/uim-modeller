module uim.modeller.views.components.forms.bodies.body_;

@safe:
import uim.modeller;

class DMDLFormBody : DAPPEntityFormBody {
  this() { super();
    this
    .crudMode(CRUDModes.Read)
    .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"]); 
  }
  this(DAPPForm myForm) { 
    this();
    this.form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (form) {
      this.crudMode(form.crudMode);

      if (auto formWithEntity = cast(IAPPWithEntity)form) {
        this.entity(formWithEntity.entity);
        if (entity) switch(field) {
          case "private": return MDLFormGroupPrivate(form).entity(entity).toH5(options);
          case "maintitle": return MDLFormGroupMainTitle(form).entity(entity).toH5(options);
          case "subtitle": return MDLFormGroupSubTitle(form).entity(entity).toH5(options);
          case "keywords": return MDLFormGroupKeywords(form).entity(entity).toH5(options);
          case "image": return MDLFormGroupImage(form).entity(entity).toH5(options);
          case "summary": return MDLFormGroupSummary(form).entity(entity).toH5(options);
          case "text": return MDLFormGroupText(form).entity(entity).toH5(options);
          default: return super.formGroup(field, readonly, options);
        }
      }
    }
    return null;
  }
}
auto MDLFormBody() { return new DMDLFormBody; }
auto MDLFormBody(DAPPForm myForm) { return new DMDLFormBody(myForm); }
auto MDLFormBody(DOOPEntity myEntity) { return new DMDLFormBody(myEntity); }
auto MDLFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLFormBody(myForm, myEntity); }

version(test_uim_modeller) {
  unittest {
    assert(MDLFormBody);
}}
