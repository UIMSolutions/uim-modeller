module uim.modeller.views.apis.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLApisDeleteView"));

  override void initialize() {
    debugMethodCall(moduleName!DMDLApisDeleteView~"::DMDLApisDeleteView("~this.name~"):initialize");   
    super.initialize;

    this
      .rootPath("/modeller/apis");
      
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Apis")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", this.rootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/apis/actions/delete")
      .parameter("rootPath", this.rootPath);
    
    this.form.header
      .parameter("rootPath", this.rootPath)
      .parameter("mainTitle", "Apis")
      .parameter("subTitle", "Apis löschen");
    
    this
      .form
        .body_(
          MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisDeleteView~"::DMDLApisDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attribute ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attribute Name:";

    this
      .form.action("/modeller/apis/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLApisDeleteView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLApisDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLApisDeleteView); 
}}