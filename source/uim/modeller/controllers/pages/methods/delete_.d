module uim.modeller.controllers.pages.methods.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLMethods",
  "MDLDelete",
  `this
    .collectionName("modeller_methods")
    .rootPath("/modeller/methods");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsDeletePageController); 
}}