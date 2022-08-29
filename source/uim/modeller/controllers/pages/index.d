module uim.modeller.controllers.pages.index;

@safe:
import uim.modeller;

class DMDLIndexPageController : DMDLEntityPageController {
  mixin(APPPageControllerThis!("MDLIndexPageController"));

  override void initialize() {
    super.initialize;

    this
    .checks([APPCheckAppSessionHasSession]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLIndexPageController~":DMDLIndexPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    // APPCheckAppSessionHasSiteId(this).check(_request, _response, reqParameters);

    if (auto appSession = getAppSession(options)) {      
      debug writeln(appSession.debugInfo);
      auto session = appSession.session; 
      auto site    = appSession.site;

      debug writeln(this.name~"-site");
      if (site) { // selected site
        debug writeln("Has Site", site.id, "/", site.name);
        session["siteId"] = site.id.toString;
        this.view(
          MDLIndexWithSiteView(this)
          .site(site)
          .layout(this.layout));
      }
      else {
        debug writeln("No Site");

        auto dbSites = database ? database["systems", "system_sites"].findMany : null;
        debug writeln("Found sites = ", dbSites.length);

        this.view(
          MDLIndexNoSiteView(this)
          .sites(dbSites)
          .layout(this.layout));
      }
    }
    else {
      debug writeln("No AppSession");
    }
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLIndexPageController~":DMDLIndexPageController::afterResponse");
    if (this.session) this.session.save;
  }

}
mixin(APPPageControllerCalls!("MDLIndexPageController"));

version(test_uim_modeller) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLIndexPageController); 
}}