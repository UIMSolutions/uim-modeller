module uim.modeller.views.delete_;

@safe:
import uim.modeller;

class DMDLDeleteView : DAPPView {
  mixin(APPViewThis!("MDLDeleteView"));
}
mixin(APPViewCalls!("MDLDeleteView"));

version(test_uim_modeller) { unittest {
  assert(MDLDeleteView);
}}