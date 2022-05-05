module uim.modeller.views.components.forms.inputs.handler;

@safe:
import uim.modeller;

class DMDLFormInputHandler : DFormInputHandler {
  mixin(FormComponentThis!("MDLFormInputHandler", true));

  override void initialize() {
    super.initialize;

    this
      .adDFormInputs([
        "attributes": MDLAttributesFormInput,
        "classname":  MDLClassNameFormInput,
        "dataformat": MDLDataFormatFormInput,
        "entities":   MDLEntitiesFormInput,
        "imagepath":  MDLIsArrayFormInput,
        "isarray":    MDLIsArrayFormInput,
        "isbig":      MDLIsBigFormInput,
        "isnullable": MDLIsNullableFormInput,
        "isreadonly": MDLIsReadOnlyFormInput,
        "github":     MDLGitHubFormInput,
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
mixin(FormComponentCalls!("MDLFormInputHandler", true));
