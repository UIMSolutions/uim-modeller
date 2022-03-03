module uim.modeller.controllers.pages.classes.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLClasses",
  "MDLUpdate",
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
		testPageController(new DMDLClassesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesUpdatePageController); 
}}