module uim.modeller.controllers.pages.methods.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLMethods",
  "MDLRead",
  `this
    .collectionName("modeller_methods")
    .rootPath("/modeller/methods");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsReadPageController); 
}}