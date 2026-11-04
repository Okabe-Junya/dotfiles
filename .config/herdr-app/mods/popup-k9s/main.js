// k9s in a dialog over the current tab, like the Herdr TUI's prefix+m popup.
// keys.json opens this mod (mod.open:popup-k9s); it starts the program in
// herdr-core, replaces itself with a terminal dialog, and that dialog closes
// by itself when the program exits.
import { View, div } from "gpui-kit";
import { hc, props, closeOverlay, openOverlay, focused, home, theme } from "herdr";

const TITLE = "k9s";
const ARGV = ["k9s"];
const SIZE = { width: 0.9, height: 0.9 };

export default class Popup extends View {
  init(_props, cx) {
    this.error = null;
    cx.spawn(async (cx) => {
      try {
        const cwd = focused()?.cwd ?? home();
        const r = await hc(["run", "--bg", "--json", "--rm", "--cwd", cwd, "--", ...ARGV]);
        if (r.code !== 0) throw new Error(r.stderr.trim() || r.stdout.trim() || `hc run exited ${r.code}`);
        const { address } = JSON.parse(r.stdout);
        closeOverlay(props().overlay);
        openOverlay({ kind: "dialog", ...SIZE, layout: { id: "popup", type: "block", content: { terminal: address } } });
      } catch (e) {
        this.error = String(e?.message ?? e);
        cx.notify();
      }
    });
  }

  render() {
    const t = theme();
    return div()
      .size_full()
      .px(12)
      .py(12)
      .text_size(12)
      .truncate()
      .text_color(this.error ? t.blocked : t.muted)
      .child(this.error ? `${TITLE}: ${this.error}` : `Starting ${TITLE}…`);
  }
}
