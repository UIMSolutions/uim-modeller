module uim.modeller.controllers.pages.attributeclasses.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLAttributeClasses",
  "MDLCreate",
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
		testPageController(new DMDLAttributeClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesCreatePageController); 
}}
