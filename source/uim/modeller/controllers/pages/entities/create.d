module uim.modeller.controllers.pages.entities.create;

@safe:
import uim.modeller;

class DMDLEntitiesCreatePageController : DMDLCreatePageController {
  mixin(APPPageControllerThis!("MDLEntitiesCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("modeller_entities")
      .rootPath("/modeller/entities");

    auto myView =  
      APPEntityCreateView(this)
        .rootPath(this.rootPath)
        .entityTab(
          UIMTab
            .panes([
              UIMTabPane
                .title("Allgemein")
                .content(H5Div("This is a primary pane")),
              UIMTabPane
                .title("Beschreibungen")
                .content(H5Div("This is a secondary pane"))
            ])
        );
    
    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = UIMBreadcrumb.items(
        ["/", "UIM"],
        ["/modeller", "Modeller"],
        [this.rootPath, "Entitäten"],
        [this.rootPath~"/create", "Erstellen"]
      );

      pgHeader
        .title(titleCreate("Entitätsklasse erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/create")
        .content(MDLEntityFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Entitätsklasse")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
        );      
    }

    this
      .view(myView);        
  }
}
mixin(APPPageControllerCalls!("MDLEntitiesCreatePageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntitiesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntitiesCreatePageController); 
}}

/*
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntitiesUpdatePageController~":DMDLEntitiesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site, "modeller_entities"].createFromTemplate;      
      debug writeln(dbEntity ? "Has entity" : "no entity :-(");

      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        debug writeln("Has entityView");

        entityView
          .entity(dbEntity)
          .crudMode(CRUDModes.Create)
          .rootPath("/modeller/entities")
          .readonly(true);
      }
    }
  }
}

*/ 

