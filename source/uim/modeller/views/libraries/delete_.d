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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(bc)
        .rootPath(this.rootPath)
        .title(titleDelete("Libraryl löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/libraries/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLLibraryFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Bibliotheken")
          .subTitle("Bibliothek löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesDeleteView~"::DMDLLibrariesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Libraryl ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Libraryl Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/libraries/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLLibrariesDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLLibrariesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLLibrariesDeleteView); 
}}
