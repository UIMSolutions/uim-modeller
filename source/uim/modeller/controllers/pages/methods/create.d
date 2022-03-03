module uim.modeller.controllers.pages.methods.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLMethods",
  "MDLCreate",
  `this
    .collectionName("modeller_methods")
    .rootPath("/modeller/methods");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLMethodsCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLMethodsCreatePageController); 
}}
