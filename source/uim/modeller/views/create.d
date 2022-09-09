module uim.modeller.views.create;

@safe:
import uim.modeller;

class DMDLCreateView : DView {
  mixin(ViewThis!("MDLCreateView"));
}
mixin(ViewCalls!("MDLCreateView"));

version(test_uim_modeller) { unittest {
  assert(MDLCreateView);
}}