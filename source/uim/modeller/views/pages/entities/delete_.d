module uim.modeller.views.pages.entities.delete_;

@safe:
import uim.modeller;

class DMDLEntityDeleteView : DAPPEntityDeleteView {
  mixin(ViewThis!("MDLEntityDeleteView"));

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
        .title(titleDelete("Entität erstellen"))
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/modeller", "Modeller"],
            [this.rootPath, "Entitäten"],
            [this.rootPath~"/delete", "Löschen"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(MDLEntityFormContent);
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .mainTitle("Neue Entität")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
      }
    }
  }
}
mixin(ViewCalls!("MDLEntityDeleteView"));

version(test_uim_modeller) { unittest {
  assert(MDLEntityDeleteView);
}}