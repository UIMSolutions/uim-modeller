module uim.modeller.controllers.actions.create;

@safe:
import uim.modeller;

class DMDLCreateAction : DAPPActionController {
  mixin(APPControllerThis!("MDLCreateAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLCreateAction~":DMDLCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (this.collection) {
      if (auto entity = collection.createFromTemplate) {             
        debug writeln("Created entity:", entity.id);
        debug writeln("Options:", options);
        entity.fromRequest(options);

        collection.insertOne(entity);
        debug writeln("entity.id = ", entity.id);

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
	}
}
mixin(APPControllerCalls!("MDLCreateAction"));
