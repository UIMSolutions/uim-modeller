module uim.modeller.controllers.pages.modules.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLModules",
  "MDLUpdate",
  `this
    .collectionName("modeller_modules")
    .rootPath("/modeller/modules")
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
		testPageController(new DMDLModulesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesUpdatePageController); 
}}