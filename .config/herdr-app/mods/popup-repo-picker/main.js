// Pick a ghq-managed repository with fzf and open it as a new space, like the
// Herdr TUI's prefix+f popup. keys.json opens this mod
// (mod.open:popup-repo-picker); it starts the picker in herdr-core, replaces
// itself with a terminal dialog, and that dialog closes by itself when the
// picker exits (after creating the space, or on Esc).
import { div, View } from "gpui-kit";
import { closeOverlay, focused, hc, home, openOverlay, props, theme } from "herdr";

const TITLE = "Open repo";
const ARGV = [
  "zsh",
  "-c",
  // biome-ignore lint/suspicious/noTemplateCurlyInString: ${dir:t} is zsh parameter expansion, not a JS placeholder
  'dir="$(ghq list -p | fzf)" && exec herdr-app do space.new --name "${dir:t}" --folder "$dir"',
];
const SIZE = { width: 0.6, height: 0.7 };

export default class Popup extends View {
  /** @type {string | null} */
  error = null;

  /**
   * @param {import("gpui-shell").Props | undefined} _props
   * @param {import("gpui-kit").AsyncContext} cx
   */
  init(_props, cx) {
    cx.spawn(async (cx) => {
      try {
        const cwd = focused()?.cwd ?? home();
        const r = await hc(["run", "--bg", "--json", "--rm", "--cwd", cwd, "--", ...ARGV]);
        if (r.code !== 0) {
          throw new Error(r.stderr.trim() || r.stdout.trim() || `hc run exited ${r.code}`);
        }
        const { address } = JSON.parse(r.stdout);
        closeOverlay(props().overlay);
        openOverlay({
          kind: "dialog",
          ...SIZE,
          layout: { id: "popup", type: "block", content: { terminal: address } },
        });
      } catch (e) {
        this.error = e instanceof Error ? e.message : String(e);
        cx.notify();
      }
    });
  }

  render() {
    // herdr.d.ts types theme() as Record<string, string>; its values are hex colors.
    const t = /** @type {Record<string, import("gpui-kit").Color>} */ (theme());
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
