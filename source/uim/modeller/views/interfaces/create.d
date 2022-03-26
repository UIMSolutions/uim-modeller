module uim.modeller.views.interfaces.create;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLInterfacesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Attribute")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Attribut erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/interfaces/actions/create")
      .rootPath(this.rootPath);
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Attribute")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }
    
    this
      .form
        .content(
            MDLAttributeFormContent); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesCreateView~"::DMDLInterfacesCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLInterfacesCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLInterfacesCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLInterfacesCreateView); 
}}
