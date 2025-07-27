import os
import subprocess
from libqtile import bar, extension, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import RectDecoration
import colors

# Alt: Mod1     Super: Mod4
mod = "mod1"
terminal = guess_terminal()
myBrowser = "firefox"

####################
# Functions
####################
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
    lazy.group["9"].toscreen()
    lazy.spawn("spotify")

def is_muted():
    output = str(subprocess.check_output(["pactl", "get-sink-mute", "@DEFAULT_SINK@"]))
    return "yes" in output

def raise_volume(*args):
    if is_muted():
        subprocess.run(["pactl", "set-sink-mute", "@DEFAULT_SINK@", "0"])
    else:
        subprocess.run(["pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%"])

@lazy.function
def toggle_program(qtile, program):
    return_code = subprocess.run(["pgrep", program]).returncode
    qtile.cmd_spawn(program) if return_code == 1 else subprocess.run(
        ["killall", program]
    )

@lazy.function
def toggle_conky(qtile):
    return_code = subprocess.run(["pgrep", "conky"]).returncode
    qtile.cmd_spawn("conky") if return_code == 1 else subprocess.run(
        ["killall", "conky"]
    )

####################
#   Keys
####################
keys = [
    # essential hotkeys
    Key([mod], "b", lazy.spawn(myBrowser), desc='Web browser'),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn('rofi -show run'), desc="Spawn a command using a prompt widget"),

    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 1 -q set PCM 5dB+")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 1 -q set PCM 5dB-")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -q set IEC958 toggle")
    ),

]

####################
# Layouts
####################

groups = [
    Group(name="1", label="I", spawn=None),
    Group(name="2", label="II", spawn=None),
    Group(name="3", label="III", spawn=None),
    Group(name="4", label="IV", spawn=None),
    Group(name="5", label="V", spawn=None),
    Group(name="6", label="VI", spawn=None),
    Group(name="7", label="VII", spawn=None),
    Group(name="8", label="VIII", spawn=None),
    Group(name="9", label="IX", spawn="spotify"),
]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )

colors = colors.CATPPUCCIN

layouts = [
    #layout.Columns(border_focus_stack=["#00000000", "#CBA6F7"], border_width=2),
    layout.MonadTall(
        border_width=2,
        margin=8,
        border_focus=colors[14],
        border_normal=colors[23],
    ),
    layout.Bsp(
        border_width=2,
        margin=2,
        border_focus=colors[14],
        border_normal=colors[23],
        ratio=1.6,
        grow_amount=2,
        ),
    layout.Spiral(
        border_width=2,
        margin=8,
        border_focus=colors[14],
        border_normal=colors[23],
    ),
    layout.Tile(
        shift_windows=True,
        border_width=2,
        margin=4,
        border_focus=colors[14],
        border_normal=colors[23],
        ratio=0.369,
        ),
    layout.Max(
        border_width=0,
        margin=0,
        ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

####################
# Widgets
####################

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=12,
    padding=0,
    foreground=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=10),
                widget.CurrentLayoutIcon(
                    scale=0.6,
                    use_mask=True,
                    padding=2,
                ),
                widget.Spacer(length=10),
                widget.GroupBox(
                    disable_drag=True,
                    toggle=False,
                    highlight_method="block",
                    borderwidth=4,
                    this_current_screen_border=colors[22],
                    block_highlight_text_color=colors[15],
                    active=colors[25],
                    urgent_alert_method="block",
                    urgent_border=colors[14],
                    urgent_text=colors[25],
                    spacing=2,
                    margin_x=2,
                    margin_y=3,
                    padding_x=2,
                    padding_y=2,
                    decorations=[
                        RectDecoration(
                            colour=colors[14],
                            radius=2,
                            filled=True,
                        )
                    ],
                ),

                widget.Spacer(length=10),

                widget.Prompt(
                    foreground=colors[15],
                ),

                widget.Spacer(length=10),

                widget.Mpris2(
                    name='spotify',
                    objname="org.mpris.MediaPlayer2.spotify",
                    display_metadata=['xesam:title', 'xesam:artist', 'xesam:artist'],
                    playing_text="\uead1 {track}",
                    paused_text="\ueb2c {track}",
                    stopped_text='Player Stopped',
                    scroll=True,
                    scroll_step=4,
                    scroll_interval=0.2,
                    scroll_clear=False,
                    scroll_delay=2,
                    width=200,
                    padding=8,
                    foreground=colors[25],
                    decorations=[
                        RectDecoration(
                            colour=colors[1],
                            radius=2,
                            filled=True,
                        )
                    ],
                ),

                widget.Spacer(length=bar.STRETCH),

                widget.Clock(
                    foreground=colors[25],
                    format=" %A, %B %d | %H:%M:%S ",
                    decorations=[
                        RectDecoration(
                            colour=colors[3],
                            radius=2,
                            filled=True,
                        )
                    ],
                ),

                widget.Spacer(),
                
                #widget.Volume(
                #    get_volume_command=os.path.expanduser(
                #        "~/.config/qtile/get-volume.sh"
                #    ),
                #    fmt="Vol:{}",
                #    foreground=colors[25],
                #    padding=8,
                #    decorations=[
                #        RectDecoration(
                #            colour=colors[8],
                #            radius=0, #radius=[3, 0, 0, 3],
                #            filled=True,
                #        )
                #    ],
                #),

                widget.ALSAWidget(
                    mode='both',
                    device='PCM',
                    theme_path='/home/suedyash/.icons/Paper-Mono-Dark/',
                    bar_width=25,
                    padding=4,
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=[2, 0, 0, 2],
                            filled=True,
                        )
                    ],
                ),

                widget.TextBox(
                    text="|",
                    foreground=colors[25],
                    padding=0,
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=0,
                            filled=True,
                        )
                    ],
                ),
                widget.TextBox(
                    text="\uf294",
                    fontsize=12,
                    foreground=colors[25],
                    padding=4,
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=0,
                            filled=True,
                        )
                    ],
                    mouse_callbacks={
                        "Button1": toggle_program("blueman-manager")
                    },
                ),
                widget.TextBox(
                    text="| ",
                    foreground=colors[25],
                    padding=0,
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=0,
                            filled=True,
                        )
                    ],
                ),
                widget.Net(
                    format="\uf1eb ",
                    mouse_callbacks={
                        "Button1": toggle_program("nm-connection-editor")
                    },
                    fontsize=26,
                    padding=0,
                    foreground=colors[25],
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=0,
                            filled=True,
                        )
                    ],
                ),
                widget.Net(
                    format="{down:>9}{down_suffix} ↓ ↑ {up:>9}{up_suffix} ",
                    prefix='M',
                    padding=0,
                    foreground=colors[25],
                    decorations=[
                        RectDecoration(
                            colour=colors[8],
                            radius=[0, 2, 2, 0],
                            filled=True,
                        )
                    ],
                ),

                widget.Spacer(length=10),
                
                widget.GenPollText(
                    update_interval=600,
                    func = lambda: subprocess.check_output("printf $(uname -r)", shell=True, text=True),
                    foreground=colors[25],
                    fmt = '  ❤  {}',
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=[2, 0, 0, 2],
                            filled=True,
                        )
                    ],
                ),
                widget.TextBox(
                    text=" | ",
                    foreground=colors[25],
                    padding=0,
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=0,
                            filled=True,
                        )
                    ],
                ),
                widget.CPU(
                    format="\uF029",
                    fontsize=16,
                    padding=2,
                    foreground=colors[25],
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=0,
                            filled=True,
                        )
                    ],
                    mouse_callbacks={"Button1": toggle_conky()},
                ),
                widget.CPU(
                    format="{load_percent:>2.0f}%",
                    foreground=colors[25],
                    update_interval=5,
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=0,
                            filled=True,
                        )
                    ],
                    mouse_callbacks={"Button1": toggle_conky()},
                ),
                widget.TextBox(
                    text=" | ",
                    foreground=colors[25],
                    padding=0,
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=0,
                            filled=True,
                        )
                    ],
                ),
                widget.DF(
                    format="{uf}/{s}{m} ",
                    foreground=colors[25],
                    visible_on_warn=False,
                    update_interval=60,
                    padding=0,
                    decorations=[
                        RectDecoration(
                            colour=colors[7],
                            radius=[0, 2, 2, 0],
                            filled=True,
                        )
                    ],
                ),

            ],
            size=24,
            border_width=4, #border_width=4,
            border_color="#181825",
            margin=[0, 0, 0, 0], #margin=[8, 8, 0, 8],
            background="#181825",
            opacity=0.69,
            name="topbar",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=colors[14],
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),   # gitk
        Match(wm_class="dialog"),         # dialog boxes
        Match(wm_class="download"),       # downloads
        Match(wm_class="error"),          # error msgs
        Match(wm_class="file_progress"),  # file progress boxes
        Match(wm_class='kdenlive'),       # kdenlive
        Match(wm_class="makebranch"),     # gitk
        Match(wm_class="maketag"),        # gitk
        Match(wm_class="notification"),   # notifications
        Match(wm_class='pinentry-gtk-2'), # GPG key password entry
        Match(wm_class="ssh-askpass"),    # ssh-askpass
        Match(wm_class="toolbar"),        # toolbars
        Match(wm_class="Yad"),            # yad boxes
        Match(title="branchdialog"),      # gitk
        Match(title='Confirmation'),      # tastyworks exit box
        Match(title='Qalculate!'),        # qalculate-gtk
        Match(title="pinentry"),          # GPG key password entry
        Match(title="tastycharts"),       # tastytrade pop-out charts
        Match(title="tastytrade"),        # tastytrade pop-out side gutter
        Match(title="tastytrade - Portfolio Report"), # tastytrade pop-out allocation
        Match(wm_class="tasty.javafx.launcher.LauncherFxApp"), # tastytrade settings
        Match(wm_class="spotify"),
        Match(wm_class="Spotify"),
        Match(wm_class="Conky"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"