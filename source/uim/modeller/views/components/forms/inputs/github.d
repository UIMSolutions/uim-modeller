module uim.modeller.views.components.forms.inputs.github;

@safe:
import uim.modeller;

class DMDLGitHubFormGroup : DAPPTextFormGroup {
  mixin(FormComponentThis!("MDLGitHubFormGroup", true));
  
  override void initialize() {
    super.initialize;

    this
    .id("entity_githubLink")
    .name("entity_githubLink")
    .fieldName("githubLink")
    .inputName("entity_githubLink")
    .label("Link zu Github"); 
  }
}
mixin(FormComponentCalls!("MDLGitHubFormGroup", true));

version(test_uim_modeller) {
  unittest {
    assert(MDGithubFormGroup);
}}