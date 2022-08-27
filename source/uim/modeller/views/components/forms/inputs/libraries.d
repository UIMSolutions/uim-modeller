module uim.modeller.views.components.forms.inputs.libraries;

@safe:
import uim.modeller;

class DMDLLibrariesFormInput : DFormInput {
  mixin(FormComponentThis!("MDLLibrariesFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_libraryId")
    .name("entity_libraryId")
    .inputName("entity_libraryId")
    .fieldName("libraryId")
    .label("In Bibliothek"); 
  }
  mixin(OProperty!("DOOPEntity[]", "libraries"));

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
    super.beforeH5(options);

    auto appSession = getAppSession(options);
    if (this.database) {
      this.libraries(database[appSession.site, "modeller_libraries"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && libraries) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No Library");
      selectOptions ~= libraries
        .sort!("a.display < b.display")
        .map!(pack => (entity[fieldName] == pack.id.toString) 
        ? H5Option(["selected":"selected", "value":pack.id.toString], pack.display)
        : H5Option(["value":pack.id.toString], pack.display)).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], 
    ["name":inputName, "readonly":"readonly", "value":entity["libraryId"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["libraryId"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLLibrariesFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
