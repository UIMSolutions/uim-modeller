module uim.modeller.views.pages.entities.read;

@safe:
import uim.modeller;

class DMDLEntityReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLEntityReadView"));

  // Initial (static) parts of a view
  override void initialize() {
    super.initialize;

    this
      .entityTab(
        UIMTab
          .panes([
            UIMTabPane
              .id("general-pane")
              .title("Allgemein")
              .content(H5Div("This is a primary pane")),
            UIMTabPane
              .id("description-pane")
              .title("Beschreibungen")
              .content(H5Div("This is a secondary pane")),
            UIMTabPane
              .id("attributes-pane")
              .title("Attribute")
              .content(H5Div("This is an attributes pane"))
          ])
      );    

  }

  // Set dynamic parts of a view
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
    
    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader
        .title(titleCreate("Entitätsklasse anzeigen"))
        .breadcrumbs(
          UIMBreadcrumb.items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Entitäten"],
            [this.rootPath~"/read", "Anzeigen"]
          ));
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/read")
        .content(
          MDLEntityFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Entitätsklassen")
          .subTitle("Entitätsklasse anzeigen");
      }
    } 
  }
}
mixin(APPViewCalls!("MDLEntityReadView"));