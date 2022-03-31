module uim.modeller.controllers.pages.entityclasses.create;

@safe:
import uim.modeller;

class DMDLEntityClassesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLEntityClassesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entityclasses")
      .rootPath("/modeller/entityclasses");

    auto myView =  
      APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .link(["href":this.rootPath], "Entitätsklasse")
        .item(["active fw-bold"], "Erstellen")
      );

      pgHeader
        .title(titleCreate("Entitätsklasse erstellen"))
        .breadcrumbs(bc);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .content(MDLAttributeFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) {
          frmHeader
            .mainTitle("Neue Entitätsklasse")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }
    }

    this
      .view(myView)
      .scripts
        .addContents(
          editorSummary~editorText,
          "window.addEventListener('load', (event) => {
            document.getElementById('entityForm').addEventListener('submit', event => {
              editorSummary.save();
              editorText.save();
            })
          });"
      );          
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesCreatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesCreatePageController); 
}}

/*
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site, "modeller_entityclasses"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        debug writeln("Has entityView");

        entityView
          .entity(dbEntity)
          .crudMode(CRUDModes.Create)
          .rootPath("/modeller/entityclasses")
          .readonly(true);
      }
    }
  }
}

*/ 

