module uim.modeller.views.components.forms.inputs.entities;

@safe:
import uim.modeller;

class DMDLEntitiesFormInput : DFormInput {
  mixin(FormComponentThis!("MDLEntitiesFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_entityid")
    .name("entity_entityid")
    .fieldName("entityId")
    .inputName("entity_entityId")
    .label("entityidThema"); 
  }
  mixin(OProperty!("DOOPEntity[]", "entityId"));

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
      this.entityId(database[appSession.site, "modeller_entities"].findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && entityId) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No entityid");
      selectOptions ~= entityId.map!(entityid => (entity[fieldName] == entityid.id.toString) 
        ? H5Option(["selected":"selected", "value":entityid.id.toString], entityid.display)
        : H5Option(["value":entityid.id.toString], entityid.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":name, "readonly":"readonly", "value":entity["entityid"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["entityid"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLEntitiesFormInput", true));

version(test_uim_cms) {
  unittest {
    // TODO Tests
}}
