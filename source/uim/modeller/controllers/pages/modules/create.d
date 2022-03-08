module uim.modeller.controllers.pages.modules.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLModules",
  "MDLCreate",
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
		testPageController(new DMDLModulesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLModulesCreatePageController); 
}}
