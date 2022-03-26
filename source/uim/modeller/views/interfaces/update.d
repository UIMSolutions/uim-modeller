module uim.modeller.views.interfaces.update;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLInterfacesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Interfaces")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Blog bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/interfaces/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(
          MDLAttributeFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Interfaces")
          .subTitle("Interfaces anzeigen");
      }
    } 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesUpdateView~"::DMDLInterfacesUpdateView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLInterfacesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLInterfacesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLInterfacesUpdateView); 
}}