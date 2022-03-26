module uim.modeller.views.entityclasses.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLEntityClassesDeleteView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Entitätenklassen")
      .link(["active"], ["href":this.rootPath~"/delete"], "Löschen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Entitätenklasse löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLEntityClassFormContent
            .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"])); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Entitätenklassen")
          .subTitle("Entitätenklasse löschen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesDeleteView~"::DMDLEntityClassesDeleteView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        .headerTitle(headerTitle)
        .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLEntityClassesDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesDeleteView); 
}}