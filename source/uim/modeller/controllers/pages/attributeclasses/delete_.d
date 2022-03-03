module uim.modeller.controllers.pages.attributeclasses.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLAttributeClasses",
  "MDLDelete",
  `this
    .collectionName("modeller_attributeclasses")
    .rootPath("/modeller/attributeclasses");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesDeletePageController); 
}}