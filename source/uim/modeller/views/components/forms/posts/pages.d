module uim.modeller.views.components.forms.posts.pages;

@safe:
import uim.modeller;
// import models.cms.entities.page;

class DMDLPageForm : DMDLPostForm {
  this() { super();
    this
    .formBody(MDLPageFormBody);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView, DOOPEntity myEntity) { this().view(myView).entity(myEntity); }
}
auto MDLPageForm() { return new DMDLPageForm; }
auto MDLPageForm(DAPPView myView) { return new DMDLPageForm(myView); }
auto MDLPageForm(DOOPEntity myEntity) { return new DMDLPageForm(myEntity); }
auto MDLPageForm(DAPPView myView, DOOPEntity myEntity) { return new DMDLPageForm(myView, myEntity); }

