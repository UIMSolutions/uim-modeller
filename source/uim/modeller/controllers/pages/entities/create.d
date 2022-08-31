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
    
    auto myView = MDLEntityCreateView(this)
      .rootPath(this.rootPath);

    string formId = myView.form.id;
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

