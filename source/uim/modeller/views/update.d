module uim.modeller.views.update;

@safe:
import uim.modeller;

class DMDLUpdateView : DAPPView {
  mixin(APPViewThis!("MDLUpdateView"));
}
mixin(APPViewCalls!("MDLUpdateView"));

version(test_uim_modeller) { unittest {
  assert(MDLUpdateView);
}}