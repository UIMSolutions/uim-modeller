module uim.modeller.controllers.pages.update;

@safe:
import uim.modeller;

class DMDLUpdatePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLUpdatePageController"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesUpdatePageController~":DMDLPackagesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (entityId && entityId.isUUID) {  
      if (auto dbEntity = database[appSession.site, this.collectionName].findOne(UUID(entityId))) {
        debug writeln("Found entity");

        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
          debug writeln("Setting entityView");
          entityView
            .entity(dbEntity)
            .crudMode(CRUDModes.Update)
            .rootPath(this.rootPath);
          }
        }
      }
    }
}
mixin(APPPageControllerCalls!("MDLUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLUpdatePageController); 
}}

auto mdlUpdatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`UpdatePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`UpdatePageController`, true)~`

    override void initialize() {
      super.initialize;

      this
        .view(
          `~classesName~`UpdateView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`UpdatePageController`, true);
}

template MDLUpdatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] MDLUpdatePageController = mdlUpdatePageController(classesName, rootController, addInitialize, addBeforeResponse);
}

/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!MDL > "~myEntities~" > Bearbeiten")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    // .securityController(APPSecurityController(this))
    .pageHeader(
      APPEditPageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Bearbeiten "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!MDL")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Bearbeiten")))
    );

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/edit.js");

    this.scripts.addContents(editorSummary~editorText);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);

    // TODO  setThemes('`~sessionId~`', '');

    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("entityForm").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          editEntity();
        })
      });`);
      else 
        addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("entityForm").addEventListener("submit", event => {
          editorSummary.save();
          editorText.save();
        })
      });`); 
 
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}
}
*/