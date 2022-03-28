module uim.modeller.controllers.pages.apis.create;

@safe:
import uim.modeller;

mixin(APPCreatePageController!(
  "MDLApis",
  "MDLCreate",
  `this
    .collectionName("modeller_apis")
    .rootPath("/modeller/apis")
    .scripts
      .addContents(
        editorSummary~editorText,
        "window.addEventListener('load', (event) => {
          document.getElementById('entityForm').addEventListener('submit', event => {
            editorSummary.save();
            editorText.save();
          })
        });"
    );`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new MDLApisCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisCreatePageController); 
}}