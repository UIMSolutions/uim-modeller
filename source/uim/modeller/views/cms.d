module uim.modeller.views.mdl;

@safe:
import uim.modeller;

class DMDLCmsView : DAPPView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLCmsView() { return new DMDLCmsView; }
auto MDLCmsView(DAPPPageController aController) { return new DMDLCmsView(aController); }

