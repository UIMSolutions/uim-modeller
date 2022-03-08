module uim.modeller.controllers.pages.methods.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLMethods",
  "MDLCreate",
  `this
    .collectionName("modeller_methods")
    .rootPath("/modeller/methods")
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
		testPageController(new DMDLMethodsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsCreatePageController); 
}}
