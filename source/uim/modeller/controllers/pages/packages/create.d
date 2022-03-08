module uim.modeller.controllers.pages.packages.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLPackages",
  "MDLCreate",
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
		testPageController(new DMDLPackagesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLPackagesCreatePageController); 
}}
