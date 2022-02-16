module uim.modeller.views.libraries.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.libraries;

class DMDLLibrariesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLLibrariesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/libraries"], "Libraryle")
      .link(["active"], ["href":"/modeller/libraries/delete"], "Löschen")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Libraryl löschen"));

    this.form
      .action("/modeller/libraries/actions/delete")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Libraryle")
      .subTitle("Libraryl löschen");
    
    this.form.formBody(
      MDLEntityClassFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesDeleteView~"::DMDLLibrariesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Libraryl ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Libraryl Name:";

    this.form
      .action("/modeller/libraries/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLLibrariesDeleteView"));