module uim.modeller.controllers.pages.classes.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLClasses",
  "MDLDelete",
  `this
    .collectionName("modeller_classes")
    .rootPath("/modeller/classes");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesDeletePageController); 
}}