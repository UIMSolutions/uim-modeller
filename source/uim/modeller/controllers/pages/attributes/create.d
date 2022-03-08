module uim.modeller.controllers.pages.attributes.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLAttributes",
  "MDLCreate",
  `this
    .collectionName("modeller_attributes")
    .rootPath("/modeller/attributes")
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
		testPageController(new DMDLAttributesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesCreatePageController); 
}}
