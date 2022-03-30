module uim.modeller.controllers.pages.create;

@safe:
import uim.modeller;

class DMDLCreatePageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLCreatePageController"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLCreatePageController~":DMDLCreatePageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (this.collection) {
      debug writeln("Found collection"); 

      auto dbEntity = collection.createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        debug writeln("Has entityView");

        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Create);
          rootPath(rootPath);
          readonly(true);
        }
      }
    }
  }
}

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLCreatePageController); 
}} 

/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!MDL > "~myEntities~" > Erstellen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, APPCheckDatabaseExists])
    // .securityController(APPSecurityController(this))      
    .pageHeader(
      APPCreatePageHeader(pgPath, myEntities, myEntity).actions(["refresh", "list"])
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!MDL")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Erstellen")))
    );

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/create.js");

    this.scripts.addContents(editorSummary~editorText);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}

  override void jsCode(STRINGAA options = null) {
    super.jsCode(options);
    if (viewMode == ViewModes.JS) 
      addToPageScript(options, 
      `window.addEventListener('load', (event) => {
        setThemes('`~"session.id.toString"~`', '');
        document.getElementById("entityForm").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          createEntity();
        })
      });`);
    else 
      addToPageScript(options, 
        `window.addEventListener('load', (event) => {
          setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
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

  override void beforeResponse(STRINGAA reqParameters) {
    // debugMethodCall(moduleName!DMDLCreatePageController~":DMDLCreatePageController::beforeResponse");
    super.beforeResponse(reqParameters);   
    if (hasError || "redirect" in reqParameters) { return; }

    auto appSession = getAppSession(reqParameters);
    // debug writeln(appSession.debugInfo); 
      
    auto site = appSession.site;
    // debug writeln(moduleName!DMDLCreatePageController~":DMDLCreatePageController::beforeResponse - Looking for entities in ", site.name, ":", collectionName);

    auto poolId = uniform(1, 1_000_000_000);
    if (auto ent = database[site.name, collectionName].createFromTemplate) entityPool[poolId] = ent;
    reqParameters["poolId"] = to!string(poolId);
  }
}
*/

