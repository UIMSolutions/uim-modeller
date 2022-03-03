module uim.modeller.controllers.pages.models.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLModels",
  "MDLUpdate",
  `this
    .collectionName("modeller_models")
    .rootPath("/modeller/models")
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
		testPageController(new DMDLModelsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModelsUpdatePageController); 
}}