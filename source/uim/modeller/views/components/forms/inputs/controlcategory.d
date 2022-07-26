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
    .fieldName("controlCategory")
    .inputName("entity_controlCategory")
    .label("Modell"); 
  }
  mixin(OProperty!("STRINGAA", "categories"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DMDLControlCategoryFormInput~":DMDLControlCategoryFormInput("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this.categories([
      "ui": "UI Control",
      "chart": "Chart Control",
      "input": "Input Control",
      "table": "Table Control",
      "form": "Form Control",
      "container": "Container Control",
    ])
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && models) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No Model");
      selectOptions ~= models
        .sort!("a.display < b.display")
        .map!(model => (entity[fieldName] == model.id.toString) 
        ? H5Option(["selected":"selected", "value":model.id.toString], model.display)
        : H5Option(["value":model.id.toString], model.display)).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["category"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["category"]);
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
