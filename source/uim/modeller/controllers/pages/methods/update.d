module uim.modeller.controllers.pages.methods.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLMethods",
  "MDLUpdate",
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
		testPageController(new DMDLMethodsUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsUpdatePageController); 
}}