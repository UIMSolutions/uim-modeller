module uim.modeller.controllers.pages.libraries.create;

@safe:
import uim.modeller;

mixin(APPCreatePageController!(
  "MDLLibraries",
  "MDLCreate",
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
		testPageController(new DMDLLibrariesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLLibrariesCreatePageController); 
}}
