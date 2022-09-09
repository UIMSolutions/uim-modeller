module uim.modeller.views.components.forms.inputs.github;

@safe:
import uim.modeller;

class DMDLGitHubFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MDLGitHubFormInput", true));
  
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
mixin(ViewComponentCalls!("MDLGitHubFormInput", true));

version(test_uim_modeller) { unittest {
    assert(MDGithubFormGroup);
}}