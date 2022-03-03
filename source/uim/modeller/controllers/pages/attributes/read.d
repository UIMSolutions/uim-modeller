module uim.modeller.controllers.pages.attributes.read;

@safe:
import uim.modeller;

mixin(MDLReadPageController!(
  "MDLAttributes",
  "MDLRead",
  `this
    .collectionName("modeller_attributes")
    .rootPath("/modeller/attributes");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesReadPageController); 
}}