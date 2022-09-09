module uim.modeller.views.indexwithsite;

@safe:
import uim.modeller;

class DMDLIndexWithSiteView : DView {
  this() { 
    super();
    this.name = "MDLIndexWithSiteView";
  }

  this(DAPPPageController myController) { 
    this().controller(myController); 
  }

  mixin(OProperty!("DOOPEntity", "site"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLIndexWithSiteView~"DMDLIndexWithSiteView::toH5");
    super.toH5(options);
    // debug writeln("uim.modeller.pages.index:serverCms.index:toH5 -> reqParameters = ", options);
    // debug writeln("uim.modeller.pages.index:serverCms.index:toH5 -> pageTitle = ", options.get("pageTitle", ""));

    return 
      [H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], site.id.toString)))].toH5;
    }
  }
auto MDLIndexWithSiteView() { return new DMDLIndexWithSiteView; }
auto MDLIndexWithSiteView(DAPPPageController myController) { return new DMDLIndexWithSiteView(myController); }
