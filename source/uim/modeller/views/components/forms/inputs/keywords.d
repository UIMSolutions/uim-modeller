module uim.modeller.views.components.forms.inputs.keywords;

@safe:
import uim.modeller;

class DMDLFormGroupKeywords : DFormInput {
  mixin(FormComponentThis!("MDLFormGroupKeywords", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_keywords")
    .name("entity_keywords")
    .fieldName("keywords")
    .inputName("entity_keywords")
    .label("Stichworte")
    .placeholder("Stichworte mit # getrennt eingeben");
  }
  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    auto input = BS5InputText(id, ["name":name]);   
    if (_crudMode != CRUDModes.Create && entity) input.value(entity["keywords"].split(",").map!(a => a.strip).join(" #"));
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(FormComponentCalls!("MDLFormGroupKeywords", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}