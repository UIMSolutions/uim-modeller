module uim.modeller.views.interfaces.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLInterfacesDeleteView"));

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
      .title(titleDelete("Blog löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/interfaces/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLAttributeFormContent); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Interfaces")
          .subTitle("Interfaces löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesDeleteView~"::DMDLInterfacesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attribute ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attribute Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/interfaces/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLInterfacesDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLInterfacesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLInterfacesDeleteView); 
}}
