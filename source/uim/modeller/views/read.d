module uim.modeller.views.read;

@safe:
import uim.modeller;

class DMDLReadView : DAPPView {
  mixin(APPViewThis!("MDLReadView"));
}
mixin(APPViewCalls!("MDLReadView"));

version(test_uim_modeller) { unittest {
  assert(MDLReadView);
}}