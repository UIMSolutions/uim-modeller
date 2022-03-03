module uim.modeller.controllers.pages.interfaces.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLInterfaces",
  "MDLUpdate",
  `this
    .collectionName("modeller_interfaces")
    .rootPath("/modeller/interfaces")
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
		testPageController(new DMDLInterfacesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLInterfacesUpdatePageController); 
}}