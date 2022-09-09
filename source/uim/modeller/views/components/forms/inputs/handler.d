module uim.modeller.views.components.forms.inputs.handler;

@safe:
import uim.modeller;

class DMDLFormInputHandler : DFormInputHandler {
  mixin(ViewComponentThis!("MDLFormInputHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormInputs([
        "attributes": MDLAttributesFormInput,
        "classname":  MDLClassNameFormInput,
        "controlcategory": MDLControlCategoryFormInput,
        "dataformat": MDLDataFormatFormInput,
        "entities":   MDLEntitiesFormInput,
        "imagepath":  MDLImagePathFormInput,
        "isarray":    MDLIsArrayFormInput,
        "isbig":      MDLIsBigFormInput,
        "isnullable": MDLIsNullableFormInput,
        "isreadonly": MDLIsReadOnlyFormInput,
        "github":     MDLGitHubFormInput,
        "keywords":   MDLFormGroupKeywords,
        "libraries":  MDLLibrariesFormInput,
        "maintitle":  MDLMainTitleFormInput,
        "models":     MDLModelsFormInput,
        "modules":    MDLModulesFormInput,
        "packages":   MDLPackagesFormInput,
        "subtitle":   MDLSubTitleFormInput,
        "summary":    MDLSummaryFormInput,
        "text":       MDLTextFormInput,
        "valueconstrainedtolist": MDLValueConstrainedToListFormInput
        ]); 
  } 
}  
mixin(ViewComponentCalls!("MDLFormInputHandler", true));
