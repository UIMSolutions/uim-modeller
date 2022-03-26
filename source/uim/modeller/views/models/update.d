module uim.modeller.views.models.update;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLModelsUpdateView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/update"], "Bearbeiten")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Modell bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/models/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath)
        .content(
          MDLModelFormContent(frm));

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Modelle")
          .subTitle("Modell anzeigen");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsUpdateView~"::DMDLModelsUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Modell ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Modell Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLModelsUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModelsUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModelsUpdateView); 
}}