module uim.modeller.controls.modals.entities.removeattributes;

@safe: 
import uim.controls;

class DMDLRemoveAttributesModalControl : DUIMModalControl {
  mixin(ControlThis!("MDLRemoveAttributesModalControl"));

  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DOOPEntity[]", "attributes"));

  override void initialize() {
    super.initialize;

    this
      .id("entity-remove-attributes");
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    this
      .headers([
        UIMModalHeader("Attribute entfernen")
      ]) 
      .bodies([
        UIMForm(
          UIMHiddenInput(["name":"entityId", "value":entity["id"]]),
          UIMList.items(
            attributes.map!(att =>
              UIMListItem(att.display)
            ).array
          )
        )
      ]); 
  }
}
mixin(ControlCalls!("MDLRemoveAttributesModalControl", "DMDLRemoveAttributesModalControl"));
mixin(ControlCalls!("MDLAddAttributesModal", "DMDLRemoveAttributesModalControl"));

version(test_uim_controls) { unittest {  
    assert(MDLAddAttributesModal);
}}