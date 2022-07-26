module uim.modeller.views.components.forms.inputs.controlcategory;

@safe:
import uim.modeller;

class DMDLControlCategoryFormInput : DFormInput {
  mixin(FormComponentThis!("MDLControlCategoryFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_controlCategory")
    .name("entity_controlCategory")
    .fieldName("category")
    .inputName("entity_controlCategory")
    .label("Modell"); 
  }
  mixin(OProperty!("STRINGAA", "categories"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DMDLControlCategoryFormInput~":DMDLControlCategoryFormInput("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this.categories([
      "bar": "Bar Control",
      "chart": "Chart Control",
      "info": "Info Control",
      "list": "List Control",
      "layout": "Layout Control",
      "popup": "Popup Control",
      "input": "Input Control",
      "map": "Map Control",
      "tile": "Tile Control",
      "table": "Table Control",
      "tree": "Tree Control",
      "action": "Action Control",
      "container": "Container Control",
    ])
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    selectOptions ~= cast(DH5Obj)H5Option(["value":""], "No Category");
    selectOptions ~= categories.keys
        .sort!("a < b")
        .map!(key => (entity[fieldName] == key) 
        ? H5Option(["selected":"selected", "value":key], categories[key])
        : H5Option(["value":key], categories[key])).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity[fieldName]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity[fieldName]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLControlCategoryFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
