module uim.modeller.views.components.forms.groups.packages;

@safe:
import uim.modeller;

class DMDLPackagesFormGroup : DAPPEntityFormGroup {
  mixin(APPFormComponentThis!("MDLPackagesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_packageId")
    .name("entity_packageId")
    .inputName("entity_packageId")
    .fieldName("packageId")
    .label("Name Package"); 
  }
  mixin(SProperty!("DOOPEntity[]", "packageId"));

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
      this.packageId(database[appSession.site.name, "modeller_packages"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && packageId) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No Package");
      selectOptions ~= packageId.map!(modelid => (entity[fieldName] == modelid.id.toString) 
        ? H5Option(["selected":"selected", "value":modelid.id.toString], modelid.display)
        : H5Option(["value":modelid.id.toString], modelid.display)).array.toH5;
    }

    auto input = H5Select(id, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["packageId"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["packageId"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(APPFormComponentCalls!("MDLPackagesFormGroup", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
