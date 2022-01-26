module uim.modeller.views.components.forms.form;

@safe:
import uim.modeller;
// import models.cms.entities.demo;

class DMDLForm : DAPPEntityForm {
  this() { super();
    this
    .formBody(MDLFormBody);
  }
  this(DAPPView myView) { this().view(myView); }
}
auto MDLForm() { return new DMDLForm; }
auto MDLForm(DAPPView myView) { return new DMDLForm(myView); }

