module uim.modeller.views.update;

@safe:
import uim.modeller;

class DMDLUpdateView : DAPPView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLUpdateView() { return new DMDLUpdateView; }
auto MDLUpdateView(DAPPPageController aController) { return new DMDLUpdateView(aController); }