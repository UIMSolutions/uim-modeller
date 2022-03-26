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

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Libraryl bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/libraries/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(
          MDLLibraryFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Libraryle")
          .subTitle("Libraryl anzeigen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLLibrariesUpdateView~"::DMDLLibrariesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Libraryl ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Libraryl Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLLibrariesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLLibrariesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLLibrariesUpdateView); 
}}