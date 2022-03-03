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

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .title(titleCreate("Modell erstellen"));

    this.form
      .action("/modeller/models/actions/create")
      .parameter("rootPath", myRootPath);
    
    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Neues Modell")
      .parameter("subTitle", "Bitte Werte eingeben");

    if (auto formHeader = cast(DAPPFormHeader)this.form.header) {
      formHeader.actions([["cancel", "save"]]);
    }
    
    this.form.body_(
      MDLModelFormBody(this.form)
      .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsCreateView~"::DMDLModelsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    this.form
      .action("/modeller/models/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
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
