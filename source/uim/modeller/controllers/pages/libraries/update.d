module uim.modeller.controllers.pages.libraries.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLLibraries",
  "MDLUpdate",
  `this
    .collectionName("modeller_libraries")
    .rootPath("/modeller/libraries")
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
		testPageController(new DMDLLibrariesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesUpdatePageController); 
}}