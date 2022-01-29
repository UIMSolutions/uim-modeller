module uim.modeller.views.components.forms.groups.handler;

@safe:
import uim.modeller;

class DMDLFormGroupHandler : DAPPFormGroupHandler {
  mixin(APPFormComponentThis!("MDLFormGroupHandler", true));

  override void initialize() {
    super.initialize;

    this
      .addFormGroups([
        "isarray": MDLIsArrayFormGroup,
        "isbig": MDLIsBigFormGroup,
        "isnullable": MDLIsNullableFormGroup,
        "isreadonly": MDLIsReadOnlyFormGroup,
        "dataformat": MDLDataFormatFormGroup,
        ]); 
  } 
}  
mixin(APPFormComponentCalls!("MDLFormGroupHandler", true));
