module uim.modeller.views.apps.update;

@safe:
import uim.modeller;
import uim.modeller.views.apps;

class DMDLAppsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLAppsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Apps")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/apps/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Apps")
      .subTitle("Apps anzeigen");
      
    this.form.formBody(
      MDLAttributeFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAppsUpdateView~"::DMDLAppsUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLAppsUpdateView"));