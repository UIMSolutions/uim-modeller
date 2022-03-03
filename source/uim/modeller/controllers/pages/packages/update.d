module uim.modeller.controllers.pages.packages.update;

@safe:
import uim.modeller;

mixin(MDLUpdatePageController!(
  "MDLPackages",
  "MDLUpdate",
  `this
    .collectionName("modeller_packages")
    .rootPath("/modeller/packages")
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
		testPageController(new DMDLPackagesUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesUpdatePageController); 
}}