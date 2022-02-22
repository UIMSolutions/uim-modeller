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
      .link(["href":"/modeller/libraries"], "Bibliotheken")
      .link(["active"], ["href":"/modeller/libraries/delete"], "Löschen")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Libraryl löschen"));

    this.form
      .action("/modeller/libraries/actions/delete")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Bibliotheken")
      .subTitle("Bibliothek löschen");
    
    this.form.body_(
      MDLLibraryFormBody(this.form));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesDeleteView~"::DMDLLibrariesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

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