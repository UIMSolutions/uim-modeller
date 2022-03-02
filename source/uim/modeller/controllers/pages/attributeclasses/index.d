module uim.modeller.controllers.pages.attributeclasses.index;

@safe:
import uim.modeller;

class DMDLAttributeClassesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAttributeClassesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributeClassesIndexView(this));
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLAttributeClassesIndexPageController~":DMDLAttributeClassesIndexPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    auto appSession = getAppSession(options);
    if (appSession) {
      if (!appSession.site) { 
        this.error("AppSession missing"); 
        return; }
    }
    else { debug writeln("AppSession missing"); return; }

    auto db = this.database;
    if (db) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return; }

    if (auto entitiesView = cast(DAPPEntitiesListView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = db[appSession.site.name, "modeller_attributeclasses"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      if ("entityName" in options) {
        auto entityName = options["entityName"].toLower;
        dbEntities = dbEntities.filter!(entity => entity.name.indexOf(entityName) == 0).array;
      } 

      entitiesView
        .entities(dbEntities)
        .rootPath("/modeller/attributeclasses");
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("MDLAttributeClassesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributeClassesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributeClassesIndexPageController); 
}}