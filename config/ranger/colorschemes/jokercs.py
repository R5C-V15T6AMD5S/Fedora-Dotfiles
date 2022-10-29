
from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import default_colors, reverse, bold, normal, default

# pylint: disable=too-many-branches,too-many-statements
class Joker(ColorScheme):
    progress_bar_color = 9

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 40
                bg = 235
            if context.border:
                fg = 5
            if context.image:
                fg = 99
            if context.video:
                fg = 66
            if context.audio:
                fg = 130
            if context.document:
                fg = 170
            if context.container:
                attr |= bold
                fg = 40
            if context.directory:
                attr |= bold
                fg = 154
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = 99
            if context.socket:
                fg = 178
                attr |= bold
            if context.fifo or context.device:
                fg = 139
                if context.device:
                    attr |= bold
            if context.link:
                fg = 223 if context.good else 116
                bg = 234
            if context.bad:
                bg = 160
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (174, 95):
                    fg = 248
                else:
                    fg = 174
            if not context.selected and (context.cut or context.copied):
                fg = 99
                bg = 234
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 223
            if context.badinfo:
                if attr & reverse:
                    bg = 94
                else:
                    fg = 94

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = 220 if context.bad else 160
            elif context.directory:
                fg = 196
            elif context.tab:
                if context.good:
                    bg = 66
            elif context.link:
                fg = 111

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 66
                elif context.bad:
                    fg = 160
            if context.marked:
                attr |= bold | reverse
                fg = 154
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 160
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 118
                attr &= ~bold
            if context.vcscommit:
                fg = 142
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 112

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 94
            elif context.vcschanged:
                fg = 174
            elif context.vcsunknown:
                fg = 174
            elif context.vcsstaged:
                fg = 108
            elif context.vcssync:
                fg = 108
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = 104
            elif context.vcsbehind:
                fg = 154
            elif context.vcsahead:
                fg = 116
            elif context.vcsdiverged:
                fg = 94
            elif context.vcsunknown:
                fg = 154

        return fg, bg, attr
