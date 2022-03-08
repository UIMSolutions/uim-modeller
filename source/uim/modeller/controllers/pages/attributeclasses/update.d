module uim.modeller.controllers.pages.attributeclasses.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLAttributeClasses",
  "MDLUpdate",
  `this
    .collectionName("modeller_attributeclasses")
    .rootPath("/modeller/attributeclasses")
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
		testPageController(new DMDLAttributeClassesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesUpdatePageController); 
}}