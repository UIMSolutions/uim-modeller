module uim.modeller.controllers.pages.entityclasses.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLEntityClasses",
  "MDLRead",
  `this
    .collectionName("modeller_entityclasses")
    .rootPath("/modeller/entityclasses");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesReadPageController); 
}}