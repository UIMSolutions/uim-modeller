module uim.modeller.controllers.pages.attributes.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLAttributes",
  "MDLCreate",
  `this
    .collectionName("modeller_attributes")
    .rootPath("/modeller/attributes");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesCreatePageController); 
}}
