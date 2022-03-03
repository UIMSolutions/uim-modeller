module uim.modeller.controllers.pages.entityclasses.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLEntityClasses",
  "MDLUpdate",
  `this
    .collectionName("modeller_entityclasses")
    .rootPath("/modeller/entityclasses")
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
		testPageController(new DMDLEntityClassesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesUpdatePageController); 
}}