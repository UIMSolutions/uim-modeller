module uim.modeller.controllers.pages.entityclasses.create;

@safe:
import uim.modeller;

mixin(MDLCreatePageController!(
  "MDLEntityClasses",
  "MDLCreate",
  `this
    .collectionName("modeller_entityclasses")
    .rootPath("/modeller/entityclasses");`));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityClassesCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityClassesCreatePageController); 
}}

/*

    .scripts
      .addContents(
        editorSummary~
        editorText,
  `window.addEventListener('load', (event) => {
    document.getElementById("entityForm").addEventListener("submit", event => {
      editorSummary.save();
      editorText.save();
    })
  });`);
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (this.database) {
      debug writeln("Found database"); 

      auto dbEntity = database[appSession.site.name, "modeller_entityclasses"].createFromTemplate;      
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

