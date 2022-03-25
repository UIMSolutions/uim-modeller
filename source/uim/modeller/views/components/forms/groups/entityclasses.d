module uim.modeller.views.components.forms.groups.entityclasses;

@safe:
import uim.modeller;

class DMDLEntityClassesFormGroup : DAPPEntityFormGroup {
  mixin(FormComponentThis!("MDLEntityClassesFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_entityclassid")
    .name("entity_entityclassid")
    .fieldName("entityClassId")
    .inputName("entity_entityClassId")
    .label("entityclassidThema"); 
  }
  mixin(SProperty!("DOOPEntity[]", "entityClassId"));

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
      this.entityClassId(database[appSession.site, "modeller_entityclasses"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && entityClassId) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No entityclassid");
      selectOptions ~= entityClassId.map!(entityclassid => (entity[fieldName] == entityclassid.id.toString) 
        ? H5Option(["selected":"selected", "value":entityclassid.id.toString], entityclassid.display)
        : H5Option(["value":entityclassid.id.toString], entityclassid.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":name, "readonly":"readonly", "value":entity["entityclassid"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["entityclassid"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLEntityClassesFormGroup", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
