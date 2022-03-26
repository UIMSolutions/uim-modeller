module uim.modeller.views.methods.create;

@safe:
import uim.modeller;
import uim.modeller.views.methods;

class DMDLMethodsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLMethodsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Method")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Attribut erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/methods/actions/create")
        .rootPath(this.rootPath)
        .content(
            MDLMethodFormContent); 
    
      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Method")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLMethodsCreateView~"::DMDLMethodsCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       // .headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLMethodsCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLMethodsCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLMethodsCreateView); 
}}
