module uim.modeller.views.apps.read;

@safe:
import uim.modeller;
import uim.modeller.views.apps;

class DMDLAppsReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLAppsReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Apps")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(
        titleView("Blog anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)
        .content(
          MDLAttributeFormContent); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Apps")
          .subTitle("Apps anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsReadView~"::DMDLAppsReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        // .headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLAppsReadView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAppsReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAppsReadView); 
}}