module uim.modeller.views.components.forms.posts.tutorials;

@safe:
import uim.modeller;
// import models.modeller.entities.tutorial; 

class DMDLTutorialForm : DMDLPostForm {
  this() { super();
    this
    .formBody(MDLTutorialFormBody);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView, DOOPEntity myEntity) { this().view(myView).entity(myEntity); }
}
auto MDLTutorialForm() { return new DMDLTutorialForm; }
auto MDLTutorialForm(DAPPView myView) { return new DMDLTutorialForm(myView); }
auto MDLTutorialForm(DOOPEntity myEntity) { return new DMDLTutorialForm(myEntity); }
auto MDLTutorialForm(DAPPView myView, DOOPEntity myEntity) { return new DMDLTutorialForm(myView, myEntity); }

