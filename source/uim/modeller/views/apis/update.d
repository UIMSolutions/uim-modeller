module uim.modeller.views.apis.update;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLApisUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Apis")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/apis/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Apis")
      .subTitle("Apis anzeigen");
      
    this.form.formBody(
      MDLAttributeFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisUpdateView~"::DMDLApisUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLApisUpdateView"));