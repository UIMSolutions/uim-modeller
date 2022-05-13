module uim.modeller.views.components.forms.inputs.packages;

@safe:
import uim.modeller;

class DMDLPackagesFormInput : DFormInput {
  mixin(FormComponentThis!("MDLPackagesFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_packageId")
    .name("entity_packageId")
    .inputName("entity_packageId")
    .fieldName("packageId")
    .label("In Package"); 
  }
  mixin(OProperty!("DOOPEntity[]", "packages"));

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
      this.packages(database[appSession.site, "modeller_packages"].findMany());

      if (this.entity && this.entity["libraryId"].length > 0) {
        auto libraryId = this.entity["libraryId"];
        this.packages(
          this.packages.filter!(p => p["libraryId"] == libraryId).array
        );
      }
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && packages) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":UUID().toString], "No Package");
      selectOptions ~= packages
        .sort!("a.display < b.display")
        .map!(pack => (entity[fieldName] == pack.id.toString) 
        ? H5Option(["selected":"selected", "value":pack.id.toString], pack.display)
        : H5Option(["value":pack.id.toString], pack.display)).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], 
    ["name":inputName, "readonly":"readonly", "value":entity["packageId"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["packageId"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLPackagesFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
