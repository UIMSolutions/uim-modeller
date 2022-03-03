module uim.modeller.controllers.pages.attributes.delete_;

@safe:
import uim.modeller;

mixin(MDLDeletePageController!(
  "MDLAttributes",
  "MDLDelete",
  `this
    .collectionName("modeller_attributes")
    .rootPath("/modeller/attributes");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesDeletePageController); 
}}