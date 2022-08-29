module uim.modeller.controllers.actions.entities.attributes;

@safe:
import uim.modeller;

void uimAddAttributesToEntityAction(HTTPServerRequest req, HTTPServerResponse res) {
  MDLAddAttributesToEntityAction(thisServer).request(req, res);
}

class DMDLAddAttributesToEntityAction : DAPPActionController {
  mixin(APPControllerThis!("MDLAddAttributesToEntityAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAddAttributesToEntityAction~":DMDLAddAttributesToEntityAction("~this.name~")::beforeResponse");
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
mixin(APPControllerCalls!("MDLAddAttributesToEntityAction"));

void uimRemoveAttributesFromEntityAction(HTTPServerRequest req, HTTPServerResponse res) {
  MDLRemoveAttributesFromEntityAction(thisServer).request(req, res);
}

class DMDLRemoveAttributesFromEntityAction : DAPPActionController {
  mixin(APPControllerThis!("MDLRemoveAttributesFromEntityAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLRemoveAttributesFromEntityAction~":DMDLRemoveAttributesFromEntityAction("~this.name~")::beforeResponse");
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
mixin(APPControllerCalls!("MDLRemoveAttributesFromEntityAction"));
