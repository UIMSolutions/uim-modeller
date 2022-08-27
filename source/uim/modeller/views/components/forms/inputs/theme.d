module uim.modeller.views.components.forms.inputs.theme;

@safe:
import uim.modeller;

class DMDLFormInputTheme : DFormInput {
  mixin(FormComponentThis!("MDLFormInputTheme", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_theme")
    .name("entity_theme")
    .fieldName("themeId")
    .label("Thema"); 
  }
  mixin(OProperty!("DOOPEntity[]", "themes"));

  auto database() {
    if (auto f = form) {
      if (auto v = f.view) {
        if (auto c = v.controller) {
          return c.database;
        }
      }
    }
    return null;
  }

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);

    auto appSession = getAppSession(options);
    if (this.database) {
      this.themes(database[appSession.site, "themes"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && themes) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No theme");
      selectOptions ~= themes.map!(theme => (entity[fieldName] == theme.id.toString) 
        ? H5Option(["selected":"selected", "value":theme.id.toString], theme.display)
        : H5Option(["value":theme.id.toString], theme.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":name, "readonly":"readonly", "value":entity["theme"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["theme"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLFormInputTheme", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}
