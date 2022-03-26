module uim.modeller.views.methods.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLMethodsDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Methods")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleDelete("Blog löschen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/methods/actions/delete")
        .rootPath(this.rootPath)
        .content(
          MDLMethodFormContent); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Methods")
          .subTitle("Methods löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsDeleteView~"::DMDLMethodsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Method ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Method Name:";

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/methods/actions/delete?entity_id="~(entity ? entity.id.toString : null))
        // .headerTitle(headerTitle)
        // .bodyTitle(bodyTitle)
        .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLMethodsDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLMethodsDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLMethodsDeleteView); 
}}