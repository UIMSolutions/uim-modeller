module uim.modeller.views.read;

@safe:
import uim.modeller;

class DMDLReadView : DView {
  mixin(ViewThis!("MDLReadView"));
}
mixin(ViewCalls!("MDLReadView"));

version(test_uim_modeller) { unittest {
  assert(MDLReadView);
}}