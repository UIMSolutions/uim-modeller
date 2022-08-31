module uim.modeller.views.pages.entities.update;

@safe:
import uim.modeller;

class DMDLEntityUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLEntityUpdateView"));

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

    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .title(titleCreate("Entitäts bearbeiten"));
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .method("post");

      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Entität")
          .subTitle("Entität bearbeiten");
      }
    }    
  }

  // Set dynamic parts of a view
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Entitäten"],
            [this.rootPath~"/update", "Bearbeiten"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/update")
        .content(MDLEntityFormContent(myForm));   
    }     
  }
}
mixin(APPViewCalls!("MDLEntityUpdateView"));