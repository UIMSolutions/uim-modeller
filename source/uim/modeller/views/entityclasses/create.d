module uim.modeller.views.entityclasses.create;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLEntityClassesCreateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");
          
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":this.rootPath], "Entitätenklassen")
      .link(["active"], ["href":this.rootPath~"/create"], "Erstellen")
    );


    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .breadcrumbs(bc)
        .rootPath(this.rootPath)
        .title(titleCreate("Entitätenklasse erstellen"))
        .actions([["refresh", "list"]]); 
    }

    if (auto frm = cast(DForm)this.form) {
      frm
        .action(this.rootPath~"/actions/create")
        .rootPath(this.rootPath)
        .content(
          MDLEntityClassFormContent
            .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"]));

      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader
          .rootPath(this.rootPath)
          .mainTitle("Neue Entitätenklasse")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"], ["print", "export"]]); 
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesCreateView~"::DMDLEntityClassesCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this.rootPath(this.rootPath);
    options["rootPath"] = this.rootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    if (auto frm = cast(DForm)this.form) {
      frm
        .action("/modeller/entityclasses/actions/create")
/*       // .headerTitle(headerTitle)
      // .bodyTitle(bodyTitle)
 */      .entity(this.entity);
    }
  }
}
mixin(APPViewCalls!("MDLEntityClassesCreateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesCreateView); 
}}
