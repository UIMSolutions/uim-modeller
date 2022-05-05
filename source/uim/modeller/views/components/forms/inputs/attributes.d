module uim.modeller.views.components.forms.inputs.attributes;

@safe:
import uim.modeller;

class DMDLAttributesFormInput : DFormInput {
  mixin(FormComponentThis!("MDLAttributesFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_attributeId")
    .name("entity_attributeId")
    .fieldName("attributeId")
    .label("Attribute"); 
  }
  mixin(SProperty!("DOOPEntity[]", "attributeEntities"));

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
      this.attributeEntities(database[appSession.site, "modeller_attributes"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && attributeEntities) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No attributeId");
      selectOptions ~= attributeEntities
        .sort!("a.display < b.display")
        .map!(att => (entity[fieldName] == att.id.toString) 
        ? H5Option(["selected":"selected", "value":att.id.toString], att.display)
        : H5Option(["value":att.id.toString], att.display)).array.toH5;
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
mixin(FormComponentCalls!("MDLAttributesFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
