module uim.modeller.controllers.pages.attributes.index;

@safe:
import uim.modeller;

class DMDLAttributesIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLAttributesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAttributesIndexView(this));
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLAttributesIndexPageController~":DMDLAttributesIndexPageController::beforeResponse");
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

      auto dbEntities = db[appSession.site.name, "modeller_attributes"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      if ("entityName" in options) {
        auto entityName = options["entityName"].toLower;
        dbEntities = dbEntities.filter!(entity => entity.name.indexOf(entityName) == 0).array;
      } 

      entitiesView
        .entities(dbEntities)
        .rootPath("/modeller/attributes");
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("MDLAttributesIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLAttributesIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLAttributesIndexPageController); 
}}