module uim.modeller.views.models.create;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLModelsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/models"], "Modelle")
      .link(["active"], ["href":"/modeller/models/create"], "Erstellen")
    );

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
      .breadcrumbs(bc)
      .rootPath(this.rootPath)
      .title(titleCreate("Modell erstellen"));
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/models/actions/create")
        .rootPath(this.rootPath)
        .content(
          MDLModelFormContent
          .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 

      if (auto frmHeader = cast(DFormHeader)frm.header) { 
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neues Modell")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsCreateView~"::DMDLModelsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/models/actions/create")
/*       // .headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
 */      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLModelsCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLModelsCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLModelsCreateView); 
}}
