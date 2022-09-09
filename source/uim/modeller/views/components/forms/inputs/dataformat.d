module uim.modeller.views.components.forms.inputs.dataformat;

@safe:
import uim.modeller;

class DMDLDataFormatFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLDataFormatFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_dataformats")
    .inputName("entity_dataFormats")
    .fieldName("dataFormats")
    .label("Datenformats"); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    DH5Obj[] selectOptions;
    if (entity) {
      auto myDataFormats = entity["dataFormats"].split(",");
      if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) {
        attributeDataFormats
          .filter!(dataformat => myDataFormats.has(dataformat.toLower))
          .each!(dataformat => selectOptions ~= H5Option(["value":dataformat.toLower, "selected":"selected"], dataformat));

/*         if (myDataFormats.has("array")) selectOptions ~= H5Option(["value":"array", "selected":"selected"], "Array");
        if (myDataFormats.has("double")) selectOptions ~= H5Option(["value":"double", "selected":"selected"], "Double");
        if (myDataFormats.has("integer")) selectOptions ~= H5Option(["value":"integer", "selected":"selected"], "Integer");
        if (myDataFormats.has("string")) selectOptions ~= H5Option(["value":"string", "selected":"selected"], "String");
        if (myDataFormats.has("uuid")) selectOptions ~= H5Option(["value":"uuid", "selected":"selected"], "UUID");
 */      }
      else {
        attributeDataFormats
          .each!(dataformat => selectOptions ~= myDataFormats.has(dataformat.toLower) 
            ? H5Option(["value":dataformat.toLower, "selected":"selected"], dataformat) 
            : H5Option(["value":dataformat.toLower], dataformat));
/*         selectOptions ~= myDataFormats.has("double") ? H5Option(["value":"double", "selected":"selected"], "Double") : H5Option(["value":"double"], "Double");
        selectOptions ~= myDataFormats.has("integer") ? H5Option(["value":"integer", "selected":"selected"], "Integer") : H5Option(["value":"integer"], "Integer");
        selectOptions ~= myDataFormats.has("string") ? H5Option(["value":"string", "selected":"selected"], "String") : H5Option(["value":"string"], "String");
        selectOptions ~= myDataFormats.has("uuid") ? H5Option(["value":"uuid", "selected":"selected"], "UUID") : H5Option(["value":"uuid"], "UUID");
 */      }
    }

    auto input = H5Select(id, ["form-select"], ["name":inputName, "size":"4", "readonly":"readonly", "value":entity["dataFormats"], "multiple":"multiple"], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["dataFormats"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        UIMFormLabel(["col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(ViewComponentCalls!("MDLDataFormatFormInput", true));

version(test_uim_modeller) { unittest {
    // TODO Tests
}}

