module uim.modeller.views.components.forms.bodies.tutorial;

@safe:
import uim.modeller;

class DMDLTutorialFormBody : DMDLPostFormBody {
  this() { super();
    this
    .fields([/* "active",  */"name", "display", "description", "maintitle", "subtitle", /* "keywords", */ "image", "summary", /* "tutorials", */ "text"]); 
  }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (form) {
      this.crudMode(form.crudMode);

      if (auto formWithEntity = cast(IAPPWithEntity)form) {
        auto entity = formWithEntity.entity;
        if (entity) switch(field) {
          case "maintitle": return MDLFormGroupMainTitle(form).entity(entity).toH5(options);
          case "subtitle":  return MDLFormGroupSubTitle(form).entity(entity).toH5(options);
          case "keywords":  return MDLFormGroupKeywords(form).entity(entity).toH5(options);
          case "image":     return MDLFormGroupImage(form).entity(entity).toH5(options);
          case "summary":   return MDLFormGroupSummary(form).entity(entity).toH5(options);
          case "themes":    return MDLFormGroupTheme(form).entity(entity).themes(form ? (cast(DMDLPostForm)form).themes : null).toH5(options);
          case "text":      return MDLFormGroupText(form).entity(entity).toH5(options);
      /*       auto entitys = repository.find("entitys").map!(a => MDLTutorial(a)).array;
      , "readonly":"readonly", "value":entity.entity.toString], options
      DH5Obj[] options;
      options ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No entity");
      foreach(entity; entitys) {
        if (entity.entity == entity.id) options ~= H5Option(["selected":"selected", "value":entity.id.toString], entity.display);
        else options ~= H5Option(["value":entity.id.toString], entity.display);
      }
      results ~= BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Tutorial"),
        BS5Col(["col"], 
          H5Select("entity", ["form-select"], ["name":"entity_entity", "readonly":"readonly", "value":entity.entity.toString], options))); */
          default: return super.formGroup(field, readonly, options); 
        }
      }
    }
    return null;
  }
}
auto MDLTutorialFormBody() { return new DMDLTutorialFormBody; }
auto MDLTutorialFormBody(DAPPForm myForm) { return new DMDLTutorialFormBody(myForm); }
auto MDLTutorialFormBody(DOOPEntity myEntity) { return new DMDLTutorialFormBody(myEntity); }
auto MDLTutorialFormBody(DAPPForm myForm, DOOPEntity myEntity) { return new DMDLTutorialFormBody(myForm, myEntity); }

version(test_uim_modeller) {
  unittest {
    assert(MDLTutorialFormBody);
}}
