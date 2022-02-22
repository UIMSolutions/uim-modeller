module uim.modeller.views.methods.update;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLMethodsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Methods")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleEdit("Blog bearbeiten"));
      
    this.form
      .action("/modeller/methods/actions/save")
      .crudMode(CRUDModes.Update)
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Methods")
      .subTitle("Methods anzeigen");
      
    this.form.body_(
      MDLMethodFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsUpdateView~"::DMDLMethodsUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLMethodsUpdateView"));