module uim.modeller.controllers.pages.delete_;

@safe:
import uim.modeller;

class DMDLDeletePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLDeletePageController"));
}
mixin(APPPageControllerCalls!("MDLDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLDeletePageController); 
}}

/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!MDL > "~myEntities~" > Löschen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    .pageHeader(
      APPDeletePageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Löschen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!MDL")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Löschen"))));

    this.scripts.addLinks(        
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/delete.js");

    this.scripts.addContents(editorSummary~editorText);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}*/
