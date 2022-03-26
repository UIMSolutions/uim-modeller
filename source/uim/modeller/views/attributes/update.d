module uim.modeller.views.attributes.update;

@safe:
import uim.modeller;
import uim.modeller.views.attributes;

class DMDLAttributesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLAttributesUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Attributes")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Blog bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/attributes/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(MDLAttributeFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Attributes")
          .subTitle("Attributes anzeigen");
      }
    } 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesUpdateView~"::DMDLAttributesUpdateView:beforeH5");
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
mixin(APPViewCalls!("MDLAttributesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributesUpdateView); 
}}