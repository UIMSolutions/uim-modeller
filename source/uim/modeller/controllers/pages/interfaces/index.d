module uim.modeller.controllers.pages.interfaces.index;

@safe:
import uim.modeller;

class DMDLInterfacesIndexPageController : DAPPEntitiesPageController {
  mixin(APPPageControllerThis!("MDLInterfacesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLInterfacesIndexView(this));
  }
  
  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLInterfacesIndexPageController~":DMDLInterfacesIndexPageController::beforeResponse");
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

      auto dbEntities = db[appSession.site.name, "modeller_interfaces"].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .entities(dbEntities)
        .rootPath("/modeller/interfaces");
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("MDLInterfacesIndexPageController"));