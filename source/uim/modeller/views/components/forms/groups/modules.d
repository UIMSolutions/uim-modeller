module uim.modeller.views.components.forms.groups.modules;

@safe:
import uim.modeller;

class DMDLModulesFormGroup : DAPPEntityFormGroup {
  mixin(APPFormComponentThis!("MDLModulesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_moduleId")
    .name("entity_moduleId")
    .fieldName("moduleId")
    .inputName("entity_moduleId")
    .label("Modul"); 
  }
  mixin(SProperty!("DOOPEntity[]", "modules"));

  DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.form && this.form.database) { return this.form.database; } // owner class has database
    return null; // no database found
  }

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DMDLModulesFormGroup~":DMDLModulesFormGroup("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (appSession) debug writeln("Has appSession");
    debug writeln(this.form ? "Has form" : "No form");

    if (this.database) {
      debug writeln("Has database");
      this.modules(database["uim", "modeller_modules"].findMany());
      debug writeln("Found %s modules".format(this.modules.length));
    } else debug writeln("Has no database");
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && modules) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No Modul");
      selectOptions ~= modules.map!(model => (entity[fieldName] == model.id.toString) 
        ? H5Option(["selected":"selected", "value":model.id.toString], model.display)
        : H5Option(["value":model.id.toString], model.display)).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["moduleId"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["moduleId"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(APPFormComponentCalls!("MDLModulesFormGroup", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
