module uim.modeller.controllers.pages.classes.create;

@safe:
import uim.modeller;

mixin(APPCreatePageController!(
  "MDLClasses",
  "MDLCreate",
  `this
    .collectionName("modeller_classes")
    .rootPath("/modeller/classes")
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
		testPageController(new DMDLClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesCreatePageController); 
}}
