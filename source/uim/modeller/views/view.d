module uim.modeller.views.view;

@safe:
import uim.modeller;

class DMDLView : DAPPView {
  mixin(APPViewThis!("MDLView"));
}
mixin(APPViewCalls!("MDLView"));

version(test_uim_modeller) { unittest {
  assert(MDLView);
}}
