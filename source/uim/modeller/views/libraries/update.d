module uim.modeller.views.libraries.update;

@safe:
import uim.modeller;
import uim.modeller.views.libraries;

class DMDLLibrariesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLLibrariesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/libraries"], "Libraryle")
      .link(["active"], ["href":"/modeller/libraries/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleEdit("Libraryl bearbeiten"));
      
    this.form
      .action("/modeller/libraries/actions/save")
      .crudMode(CRUDModes.Update)
      .parameter("rootPath", myRootPath);

    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Libraryle")
      .parameter("subTitle", "Libraryl anzeigen");
      
    this.form.body_(
      MDLLibraryFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesUpdateView~"::DMDLLibrariesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Libraryl ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Libraryl Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLLibrariesUpdateView"));