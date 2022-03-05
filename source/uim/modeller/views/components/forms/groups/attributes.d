module source.uim.modeller.views.components.forms.groups.attributes;

@safe:
import uim.modeller;

class DMDLAttributesFormGroup : DAPPEntityFormGroup {
  mixin(APPFormComponentThis!("MDLAttributesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_attributeId")
    .name("entity_attributeId")
    .fieldName("attributeId")
    .label("Attribute"); 
  }
  mixin(SProperty!("DOOPEntity[]", "attributeId"));

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
      this.attributeId(database[appSession.site.name, "modeller_attributes"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && attributeId) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No attributeId");
      selectOptions ~= attributeId.map!(attributeId => (entity[fieldName] == attributeId.id.toString) 
        ? H5Option(["selected":"selected", "value":attributeId.id.toString], attributeId.display)
        : H5Option(["value":attributeId.id.toString], attributeId.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":name, "readonly":"readonly", "value":entity["attributeId"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["attributeId"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(APPFormComponentCalls!("MDLAttributesFormGroup", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
