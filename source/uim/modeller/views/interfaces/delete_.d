module uim.modeller.views.interfaces.delete_;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesDeleteView : DAPPEntityDeleteView {
  mixin(APPViewThis!("MDLInterfacesDeleteView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Interfaces")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleDelete("Blog löschen"));

    this.form
      .action("/modeller/interfaces/actions/delete")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Interfaces")
      .subTitle("Interfaces löschen");
    
    this
      .form
        .formBody(
          MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesDeleteView~"::DMDLInterfacesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Attribute ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Attribute Name:";

    this
      .form.action("/modeller/interfaces/actions/delete?entity_id="~(entity ? entity.id.toString : null))
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLInterfacesDeleteView"));