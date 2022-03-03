module uim.modeller.controllers.pages.classes.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLClasses",
  "MDLCreate",
  `this
    .collectionName("modeller_classes")
    .rootPath("/modeller/classes");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLClassesCreatePageController); 
}}
