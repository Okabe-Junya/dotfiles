// `gh pr status` for the focused pane's repository in a dialog over the
// current tab, like the Herdr TUI's prefix+i popup. keys.json opens this mod
// (mod.open:popup-pr-status); it starts the program in herdr-core, replaces
// itself with a terminal dialog, and that dialog closes by itself when the
// program exits (any key, after the output).
import { View, div } from "gpui-kit";
import { hc, props, closeOverlay, openOverlay, focused, home, theme } from "herdr";

const TITLE = "PR status";
const ARGV = ["zsh", "-c", "gh pr status; echo; echo '[press any key to close]'; read -sk1"];
const SIZE = { width: 0.8, height: 0.8 };

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
