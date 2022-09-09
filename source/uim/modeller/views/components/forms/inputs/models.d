module uim.modeller.views.components.forms.inputs.models;

@safe:
import uim.modeller;

class DMDLModelsFormInput : DFormInput {
  mixin(ViewComponentThis!("MDLModelsFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_modelId")
    .name("entity_modelId")
    .fieldName("modelId")
    .inputName("entity_modelId")
    .label("Modell"); 
  }
  mixin(OProperty!("DOOPEntity[]", "models"));

  DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.view && this.view.database) { return this.view.database; } // owner class has database
    return null; // no database found
  }

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DMDLModelsFormInput~":DMDLModelsFormInput("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (appSession) debug writeln("Has appSession");

    if (this.database) {
      debug writeln("Has database");
      this.models(database["uim", "modeller_models"].findMany());
      debug writeln("Found %s models".format(this.models.length));
    } else debug writeln("Has no database");
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

    auto input = H5Select(id, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["modelid"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["modelid"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(ViewComponentCalls!("MDLModelsFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
