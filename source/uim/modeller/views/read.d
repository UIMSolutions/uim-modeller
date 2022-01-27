module uim.modeller.views.read;

@safe:
import uim.modeller;

class DMDLReadView : DAPPView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLReadView() { return new DMDLReadView; }
auto MDLReadView(DAPPPageController aController) { return new DMDLReadView(aController); }