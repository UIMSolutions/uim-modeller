module uim.modeller.views.components.forms.groups.handler;

@safe:
import uim.modeller;

class DMDLFormGroupHandler : DAPPFormGroupHandler {
  mixin(APPFormComponentThis!("MDLFormGroupHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormGroups([
        "attributeclasses": MDLAttributeClassesFormGroup,
        "dataformat": MDLDataFormatFormGroup,
        "entityclasses": MDLEntityClassesFormGroup,
        "imagepath": MDLIsArrayFormGroup,
        "isarray": MDLIsArrayFormGroup,
        "isbig": MDLIsBigFormGroup,
        "isnullable": MDLIsNullableFormGroup,
        "isreadonly": MDLIsReadOnlyFormGroup,
        "models": MDLModelsFormGroup,
        "packages": MDLPackagesFormGroup,
        "summary": MDLSummaryFormGroup,
        "text": MDLTextFormGroup,
        "valueconstrainedtolist": MDLValueConstrainedToListFormGroup
        ]); 
  } 
}  
mixin(APPFormComponentCalls!("MDLFormGroupHandler", true));
