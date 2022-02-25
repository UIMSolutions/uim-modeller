module uim.modeller.views.components.forms.groups.attributeclasses;

@safe:
import uim.modeller;

class DMDLAttributeClassesFormGroup : DAPPEntityFormGroup {
  mixin(APPFormComponentThis!("MDLAttributeClassesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_modelid")
    .name("entity_modelid")
    .fieldName("modelidId")
    .label("modelidThema"); 
  }
  mixin(SProperty!("DOOPEntity[]", "attributeclassId"));

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
      this.attributeclassId(database[appSession.site.name, "modeller_attributeclasses"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && attributeclassId) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No modelid");
      selectOptions ~= attributeclassId.map!(modelid => (entity[fieldName] == modelid.id.toString) 
        ? H5Option(["selected":"selected", "value":modelid.id.toString], modelid.display)
        : H5Option(["value":modelid.id.toString], modelid.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":name, "readonly":"readonly", "value":entity["modelid"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["modelid"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(APPFormComponentCalls!("MDLAttributeClassesFormGroup", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
