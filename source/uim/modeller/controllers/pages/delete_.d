module uim.modeller.controllers.pages.delete_;

@safe:
import uim.modeller;

class DMDLDeletePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLDeletePageController"));

  mixin(OProperty!("string", "rootPath"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLDeletePageController~":DMDLDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database[appSession.site.name, this.collectionName].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        entityView
          .entity(dbEntity)
          .crudMode(CRUDModes.Delete)
          .rootPath(this.rootPath)
          .readonly(true);
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLDeletePageController); 
}}

auto mdlDeletePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`DeletePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`DeletePageController`, true)~`

    override void initialize() {
      super.initialize;

      this
        .view(
          `~classesName~`DeleteView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`DeletePageController`, true);
}

template MDLDeletePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] MDLDeletePageController = mdlDeletePageController(classesName, rootController, addInitialize, addBeforeResponse);
}


/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!MDL > "~myEntities~" > Löschen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    .pageHeader(
      APPDeletePageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Löschen "~myEntity)
      .bdeletecrumbs(BS5BdeletecrumbList(["bdeletecrumb-arrows"])
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
