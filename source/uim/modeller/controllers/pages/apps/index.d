module uim.modeller.controllers.pages.apps.index;

@safe:
import uim.modeller;

class DMDLAppsIndexPageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLAppsIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLAppsIndexView(this));
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLAppsIndexPageController~":DMDLAppsIndexPageController::beforeResponse");
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

      auto dbEntities = db[appSession.site.name, "modeller_apps"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .entities(dbEntities)
        .rootPath("/modeller/apps");
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("MDLAppsIndexPageController"));