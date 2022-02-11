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
      .link(["href":myRootPath], "Methods")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/methods/actions/delete")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Methods")
      .subTitle("Methods löschen");
    
    this
      .form
        .formBody(
          MDLMethodFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsDeleteView~"::DMDLMethodsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Method ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Method Name:";

    this
      .form.action("/modeller/methods/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLMethodsDeleteView"));