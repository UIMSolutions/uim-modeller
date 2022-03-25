module uim.modeller.views.components.forms.groups.handler;

@safe:
import uim.modeller;

class DMDLFormGroupHandler : DFormGroupHandler {
  mixin(FormComponentThis!("MDLFormGroupHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormGroups([
        "attributeclasses": MDLAttributeClassesFormGroup,
        "classname": MDLClassNameFormGroup,
        "dataformat": MDLDataFormatFormGroup,
        "entityclasses": MDLEntityClassesFormGroup,
        "imagepath": MDLIsArrayFormGroup,
        "isarray": MDLIsArrayFormGroup,
        "isbig": MDLIsBigFormGroup,
        "isnullable": MDLIsNullableFormGroup,
        "isreadonly": MDLIsReadOnlyFormGroup,
        "github": MDLGitHubFormGroup,
        "maintitle": MDLMainTitleFormGroup,
        "models": MDLModelsFormGroup,
        "modules": MDLModulesFormGroup,
        "packages": MDLPackagesFormGroup,
        "subtitle": MDLSubTitleFormGroup,
        "summary": MDLSummaryFormGroup,
        "text": MDLTextFormGroup,
        "valueconstrainedtolist": MDLValueConstrainedToListFormGroup
        ]); 
  } 
}  
mixin(FormComponentCalls!("MDLFormGroupHandler", true));
