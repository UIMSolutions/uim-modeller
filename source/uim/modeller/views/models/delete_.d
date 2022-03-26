module uim.modeller.views.models.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLModelsDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/delete"], "Löschen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Modell löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/models/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLModelFormContent);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Modelle")
          .subTitle("Modell löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsDeleteView~"::DMDLModelsDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Modell ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modell Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/models/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLModelsDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModelsDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModelsDeleteView); 
}}