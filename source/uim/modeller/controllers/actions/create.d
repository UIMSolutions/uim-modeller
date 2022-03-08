module uim.modeller.controllers.actions.create;

@safe:
import uim.modeller;

class DMDLCreateAction : DMDLAction {
  mixin(APPControllerThis!("MDLCreateAction"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLCreateAction~":DMDLCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (this.collection) {
      if (auto entity = collection.createFromTemplate) {             
        debug writeln("Created entity:", entity.id);

        entity.fromRequest(options);

        collection.insertOne(entity);
        debug writeln("entity.id = ", entity.id);

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
	}
}
mixin(APPControllerCalls!("MDLCreateAction"));
