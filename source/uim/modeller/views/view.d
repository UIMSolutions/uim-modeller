module uim.modeller.views.view;

@safe:
import uim.modeller;

class DMDLView : DView {
  mixin(ViewThis!("MDLView"));
}
mixin(ViewCalls!("MDLView"));

version(test_uim_modeller) { unittest {
  assert(MDLView);
}}
