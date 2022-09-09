module uim.modeller.views.list;

@safe:
import uim.modeller;

class DMDLListView : DView {
  this() { super(); }
  this(DAPPPageController aController) { this().controller(aController); }
}
auto MDLListView() { return new DMDLListView; }
auto MDLListView(DAPPPageController aController) { return new DMDLListView(aController); }