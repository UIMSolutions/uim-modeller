module uim.modeller.views.attributes.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.attributes;

class DMDLAttributesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLAttributesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attributes")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/attributes/actions/delete")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Attributes")
      .subTitle("Attributes löschen");
    
    this
      .form
        .body_(
          MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLAttributesDeleteView~"::DMDLAttributesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attribute ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attribute Name:";

    this
      .form.action("/modeller/attributes/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLAttributesDeleteView"));