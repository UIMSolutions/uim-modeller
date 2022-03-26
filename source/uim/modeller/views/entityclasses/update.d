module uim.modeller.views.entityclasses.update;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLEntityClassesUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätenklassen")
      .link(["active"], ["href":"/modeller/entityclasses/update"], "Bearbeiten")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleEdit("Entitätenklasse bearbeiten"));
    }
      
    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/entityclasses/actions/save")
        .crudMode(CRUDModes.Update)
        .rootPath(this.rootPath);
        .content(
          MDLEntityClassFormContent
            .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"])); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Entitätsklassen")
          .subTitle("Entitätsklasse bearbeiten");
      }
    }      
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdateView~"::DMDLEntityClassesUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Entitätenklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Entitätenklasse Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLEntityClassesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesUpdateView); 
}}