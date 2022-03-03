module uim.modeller.controllers.pages.apis.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLApis",
  "MDLUpdate",
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
		testPageController(new DMDLApisUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLApisUpdatePageController); 
}}