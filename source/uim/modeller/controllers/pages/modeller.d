module uim.modeller.controllers.pages.modeller;

@safe:
import uim.modeller;

class DMDLMdlPageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLMdlPageController"));

  override void initialize() {
    super.initialize;
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMdlPageController~":DMDLMdlPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    if (database) {
      auto blogs = database["modeller", "sites"].findMany;
      auto docus = database["modeller", "docus"].findMany;
      auto glossary = database["modeller", "glossary"].findMany;
      auto news = database["modeller", "news"].findMany;
      auto links = database["modeller", "links"].findMany;
    }    
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLMdlPageController~":DMDLMdlPageController::afterResponse");
    super.afterResponse(options);
  }

}
mixin(APPPageControllerCalls!("MDLMdlPageController"));

version(test_uim_mdl) {
  unittest {
    assert(new DMDLMdlPageController);
    assert(MDLMdlPageController);
  }
} 