module uim.modeller.views.update;

@safe:
import uim.modeller;

class DMDLUpdateView : DView {
  mixin(ViewThis!("MDLUpdateView"));
}
mixin(ViewCalls!("MDLUpdateView"));

version(test_uim_modeller) { unittest {
  assert(MDLUpdateView);
}}