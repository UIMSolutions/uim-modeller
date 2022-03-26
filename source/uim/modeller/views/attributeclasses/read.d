module uim.modeller.views.attributeclasses.read;

@safe:
import uim.modeller;
import uim.modeller.views.attributeclasses;

class DMDLAttributeClassesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLAttributeClassesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/attributeclasses"], "Attributklassen")
      .link(["active"], ["href":"/modeller/attributeclasses/read"], "Anzeigen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleView("Attributklasse anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)
        .content(
          MDLAttributeClassFormContent);

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Attributklassen")
          .subTitle("Attributklasse anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesReadView~"::DMDLAttributeClassesReadView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attributklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attributklasse Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLAttributeClassesReadView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributeClassesReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributeClassesReadView); 
}}