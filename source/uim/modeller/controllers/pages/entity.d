module uim.modeller.controllers.pages.entity;

@safe:
import uim.modeller;

class DMDLEntityPageController : DAPPEntityPageController {
  mixin(APPPageControllerThis!("MDLEntityPageController"));

  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("string", "entityId"));
  
  override void initialize() {
    super.initialize;

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityPageController~":DMDLEntityPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    this.tenant(ETBNullTenant).collection(ETBNullCollection);

    this.entityId(
      options.get("entity_id", options.get("id", options.get("entityId", null))));
   
    this
      .tenant(database[appSession.site])
      .collection(this.tenant[this.collectionName]);
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