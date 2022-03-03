module uim.modeller.controllers.pages.entityclasses.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLEntityClasses",
  "MDLDelete",
  `this
    .collectionName("modeller_entityclasses")
    .rootPath("/modeller/entityclasses");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesDeletePageController); 
}}