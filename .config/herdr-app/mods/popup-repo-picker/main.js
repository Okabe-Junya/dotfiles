// Pick a ghq-managed repository with fzf and open it as a new space, like the
// Herdr TUI's prefix+f popup. keys.json opens this mod
// (mod.open:popup-repo-picker); it starts the picker in herdr-core, replaces
// itself with a terminal dialog, and that dialog closes by itself when the
// picker exits (after creating the space, or on Esc).
import { View, div } from "gpui-kit";
import { hc, props, closeOverlay, openOverlay, focused, home, theme } from "herdr";

const TITLE = "Open repo";
const ARGV = ["zsh", "-c", 'dir="$(ghq list -p | fzf)" && exec herdr-app do space.new --name "${dir:t}" --folder "$dir"'];
const SIZE = { width: 0.6, height: 0.7 };

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
