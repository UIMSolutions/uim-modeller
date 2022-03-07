module uim.modeller.controllers.pages.entity;

@safe:
import uim.modeller;

class DMDLEntityPageController : DAPPEntityPageController {
  mixin(APPPageControllerThis!("MDLEntityPageController"));

  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DETBTenant", "tenant"));
  
  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLCreatePageController~":DMDLCreatePageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    this.tenant(ETBNullTenant).collection(ETBNullCollection);
    if (this.database) {
      debug writeln("Found database"); 

      this.tenant(database[appSession.site.name]);
      if (this.tenant) {
        this.collection(this.tenant[this.collectionName]);
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLEntityPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLEntityPageController); 
}}