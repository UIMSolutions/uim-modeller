module uim.modeller.views.delete_;

@safe:
import uim.modeller;

class DMDLDeleteView : DView {
  mixin(ViewThis!("MDLDeleteView"));
}
mixin(ViewCalls!("MDLDeleteView"));

version(test_uim_modeller) { unittest {
  assert(MDLDeleteView);
}}