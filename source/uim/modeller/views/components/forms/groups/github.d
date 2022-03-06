module uim.modeller.views.components.forms.groups.github;

@safe:
import uim.modeller;

class DMDLGitHubFormGroup : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("MDLGitHubFormGroup", true));
  
  override void initialize() {
    super.initialize;

    this
    .id("entity_githubLink")
    .name("entity_githubLink")
    .fieldName("githubLink")
    .label("Link zu Github"); 
  }
}
mixin(APPFormComponentCalls!("MDLGitHubFormGroup", true));

version(test_uim_modeller) {
  unittest {
    assert(MDGithubFormGroup);
}}