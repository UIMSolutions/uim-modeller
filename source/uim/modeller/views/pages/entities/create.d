module uim.modeller.views.pages.entities.create;

@safe:
import uim.modeller;

class DMDLEntityCreateView : DAPPEntityCreateView {
  mixin(ViewThis!("MDLEntityCreateView"));

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
              .content(H5Div("This is a secondary pane"))
          ])
      );

    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .title(titleCreate("Entität erstellen"));
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(
          MDLEntityFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neue Entität")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel", "save"]]);
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
          ); 
    }   
  }

  // Set dynamic parts of a view
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityCreateView~":DMDLEntityCreateView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; } 

    if (auto myPageHeader = cast(DPageHeader)this.header) {
      myPageHeader
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Entitäten"],
            [this.rootPath~"/create", "Erstellen"]
          );
    }
  } 
}
mixin(ViewCalls!("MDLEntityCreateView"));

version(test_uim_modeller) { unittest {
  assert(MDLEntityCreateView);
}}