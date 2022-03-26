module uim.modeller.views.attributeclasses.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.attributeclasses;

class DMDLAttributeClassesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLAttributeClassesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/attributeclasses"], "Attributklassen")
      .link(["active"], ["href":"/modeller/attributeclasses/delete"], "Löschen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Blog löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/attributeclasses/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLAttributeClassFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Attributklassen")
          .subTitle("Attributklasse löschen");
      }
    } 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributeClassesDeleteView~"::DMDLAttributeClassesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attributklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attributklasse Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/attributeclasses/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLAttributeClassesDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLAttributeClassesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLAttributeClassesDeleteView); 
}}