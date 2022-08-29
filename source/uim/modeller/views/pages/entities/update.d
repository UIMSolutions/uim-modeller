module uim.modeller.views.pages.entities.update;

@safe:
import uim.modeller;

class DMDLEntityUpdateView : DMDLUpdateView {
  mixin(APPViewThis!("MDLEntityUpdateView"));
}
mixin(APPViewCalls!("MDLEntityUpdateView"));