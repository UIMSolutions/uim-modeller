module uim.modeller.controls.modals.entities.addattributes;

@safe: 
import uim.controls;

class DMDLAddAttributesModalControl : DUIMModalControl {
  mixin(ControlThis!("MDLAddAttributesModalControl"));

  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DOOPEntity[]", "entityAttributes"));

  override void initialize() {
    super.initialize;

    this
      .id("entity-add-attributes");
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    this
      .headers([
        UIMModalHeader("Attribute hinzufügen")
      ]) 
      .bodies([
        UIMModalBodyControl(
          UIMForm(
            UIMHiddenInput(["name":"entityId", "value":entity["id"]]),
            UIMList.items(
              entityAttributes.map!(att =>
                UIMListItem(att.display)
              ).array
            )
          )
        )]
      ); 
  }
}
mixin(ControlCalls!("MDLAddAttributesModalControl", "DMDLAddAttributesModalControl"));
mixin(ControlCalls!("MDLAddAttributesModal", "DMDLAddAttributesModalControl"));

version(test_uim_controls) { unittest {  
    assert(MDLAddAttributesModal);
}}

