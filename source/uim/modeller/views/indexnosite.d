module uim.modeller.views.indexnosite;

@safe:
import uim.modeller;

class DMDLIndexNoSiteView : DView { 
  mixin(ViewThis!("MDLIndexNoSiteView"));

  mixin(OProperty!("DOOPEntity[]", "sites"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLIndexNoSiteView~"DMDLIndexNoSiteView::toH5");
    super.toH5(options);
    // debug writeln("uim.modeller.pages.index:serverCms.index:toH5 -> reqParameters = ", options);
    // debug writeln("uim.modeller.pages.index:serverCms.index:toH5 -> pageTitle = ", options.get("pageTitle", ""));

    debug writeln("Existing sites: ", sites.length);
    DH5Obj[] sitesContent; 
    foreach(s; sites) {
      sitesContent ~= 
        H5Div(["style":"width:300px"],
          H5Div(["ratio ratio-1x1"], 
            BS5Form(["method":"Post", "action": "/sites/select?siteId="~s.id.toString], 
              BS5Card(["h-100"])
                .body_(["text-center"], 
                  H5Div(["card-title mb-1"], s.id.toString),
                  H5Div(["card-title mb-1"], s.display),
                  H5Div(["text-muted"], BS5ButtonSubmit(["btn-info"], "Site auswählen"))))));
    }

    return [
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            BS5Row(["row-deck row-cards"], sitesContent)))].toH5;
    }
  }
mixin(ViewCalls!("MDLIndexNoSiteView"));
