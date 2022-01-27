module uim.modeller.views.delete_;

@safe:
import uim.modeller;

class DMDLDeleteView : DAPPView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLDeleteView() { return new DMDLDeleteView; }
auto MDLDeleteView(DAPPPageController aController) { return new DMDLDeleteView(aController); }