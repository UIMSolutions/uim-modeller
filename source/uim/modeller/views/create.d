module uim.modeller.views.create;

@safe:
import uim.modeller;

class DMDLCreateView : DAPPView {
  mixin(APPViewThis!("MDLCreateView"));
}
mixin(APPViewCalls!("MDLCreateView"));

version(test_uim_modeller) { unittest {
  assert(MDLCreateView);
}}