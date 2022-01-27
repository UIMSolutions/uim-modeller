module uim.modeller.views.create;

@safe:
import uim.modeller;

class DMDLCreateView : DAPPView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLCreateView() { return new DMDLCreateView; }
auto MDLCreateView(DAPPPageController aController) { return new DMDLCreateView(aController); }