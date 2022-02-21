module uim.modeller.views.classes.update;

@safe:
import uim.modeller;
import uim.modeller.views.classes;

class DMDLClassesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLClassesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Classes")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/classes/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Classes")
      .subTitle("Classes anzeigen");
      
    this.form.formBody(
      MDLAttributeFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLClassesUpdateView~"::DMDLClassesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLClassesUpdateView"));