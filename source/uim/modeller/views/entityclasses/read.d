module uim.modeller.views.entityclasses.read;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLEntityClassesReadView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");
      
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätsklassen")
      .link(["active"], ["href":"/modeller/entityclasses/read"], "Anzeigen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleView("Entitätsklasse anzeigen"));
    }
    
    if (auto frm = cast(DForm)this.form) {
      frm
        .rootPath(this.rootPath)
        .content(
          MDLEntityClassFormContent
            .crudMode(CRUDModes.Read)
            .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"]));

        if (auto frmHeader = cast(DFormHeader)frm.header) { 
          frmHeader
            .rootPath(this.rootPath)
            .mainTitle("Entitätsklassen")
            .subTitle("Entitätsklasse anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesReadView~"::DMDLEntityClassesReadView("~this.name~"):beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto frm = cast(DForm)this.form) {
      frm.entity(
        this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLEntityClassesReadView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesReadView); 
}}