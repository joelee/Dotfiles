# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, EzKey, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy


# Config Vars
mod = "mod4"

app_launcher = "rofi -show drun"
app_terminal = "alacritty"
app_browser = "firefox"
app_file_manager = "thunar"


# Custom Functions
@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


@lazy.function
def monadwide_flip(qtile):
    # Work in progress
    current_layout_name = qtile.current_group.layout_name
    if current_layout_name == 'monadwide':
        qtile.current_group.layout.flip()


@lazy.window.function
def float_and_focus_window(window):
    if window.floating:
        window.disable_floating()
    else:
        x_unit = int(3840/5)
        y_unit = int(2160/3)
        window.enable_floating()
        window.set_position_floating(
            x=x_unit,
            y=y_unit,
        )
        window.set_size_floating(
            w=x_unit * 3,
            h=y_unit * 2
        )
        window.focus()


# Key bindings
keys = [
    # Switch between windows
    EzKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-k", lazy.layout.up(), desc="Move focus up"),
    EzKey("M-<Space>", lazy.layout.next(), desc="Move window focus to next window"),
    EzKey("M-S-<Space>", lazy.layout.previous(), desc="Move window focus to previous window"),

    # Move windows
    EzKey("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EzKey("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    EzKey("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EzKey("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows
    EzKey("M-C-h", lazy.layout.grow_left(), desc="Grow window to the left"),
    EzKey("M-C-l", lazy.layout.grow_right(), desc="Grow window to the right"),
    EzKey("M-C-j", lazy.layout.grow_down(), desc="Grow window down"),
    EzKey("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),

    # Window modes
    EzKey("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
    EzKey("M-m", lazy.layout.maximize()),
    EzKey("M-S-m", minimize_all(), desc="Toggle all windows minimize"),
    EzKey("M-f", lazy.layout.toggle_fullscreen()),
    EzKey("M-t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    EzKey("M-C-f", lazy.layout.flip(), desc="Flip main pane"),

    # Spawn Apps
    EzKey("M-r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    EzKey("M-a", lazy.spawn(app_launcher), desc="Launch App Launcher"),
    EzKey("M-<Return>", lazy.spawn(app_terminal), desc="Launch terminal"),
    EzKey("M-<slash>", lazy.spawn(app_file_manager), desc="Launch file manager"),
    EzKey("M-b", lazy.spawn(app_browser), desc="Launch web browser"),


    # QTile controls
    EzKey("M-<Tab>", lazy.next_layout(), desc="Toggle between layouts"),
    EzKey("M-S-<Tab>", lazy.previous_layout(), desc="Toggle between layouts"),
    EzKey("M-C-w", lazy.window.kill(), desc="Kill focused window"),
    EzKey("M-C-r", lazy.reload_config(), desc="Reload the config"),
    EzKey("M-C-S-r", lazy.restart(), desc="Restart Qtile"),
    EzKey("M-C-S-q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Alternate navigation with arrow keys
    EzKey("M-<Left>", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-<Right>", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-<Down>", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-<Up>", lazy.layout.up(), desc="Move focus up"),

    EzKey("M-S-<Left>", lazy.layout.swap_left()),
    EzKey("M-S-<Right>", lazy.layout.swap_right()),
    EzKey("M-S-<Down>", lazy.layout.swap_down()),
    EzKey("M-S-<Up>", lazy.layout.swap_up()),
    EzKey("M-S-<Return>", lazy.layout.swap_main(), desc="Swap current to main pane"),

    EzKey("M-C-<Left>", lazy.layout.grow_left(), desc="Grow window to the left"),
    EzKey("M-C-<Right>", lazy.layout.grow_right(), desc="Grow window to the right"),
    EzKey("M-C-<Down>", lazy.layout.grow_down(), desc="Grow window down"),
    EzKey("M-C-<Up>", lazy.layout.grow_up(), desc="Grow window up"),

    EzKey("M-<Page_Up>", lazy.layout.shrink(), desc="Shrink current pane"),
    EzKey("M-<Page_Down>", lazy.layout.grow(), desc="Grow current pane"),
    EzKey("M-C-<Page_Up>", lazy.layout.shrink_main(), desc="Shrink Main pane"),
    EzKey("M-C-<Page_Down>", lazy.layout.grow_main(), desc="Grow Main pane"),
    EzKey("M-S-<Page_Up>", lazy.layout.decrease_ratio()),
    EzKey("M-S-<Page_Down>", lazy.layout.increase_ratio()),

    EzKey("M-<Home>", float_and_focus_window()),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

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
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.TreeTab(),
    layout.MonadTall(),
    layout.MonadThreeCol(
        border_focus="#FF3333",
        border_normal="#118811",
        ratio=0.5
    ),
    layout.MonadWide(),
    # layout.Plasma(),
    layout.Matrix(),
    layout.Floating(),
    layout.Max(),

    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    #layout.Stack(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                    filename="~/.config/qtile/phoenix.svg",
                    margin_y=5, margin_x=9, scale=True,
                    mouse_callbacks = {"Button1": lambda: qtile.cmd_spawn(app_launcher)},
                ),
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CPU(foreground="#003300", background="#DDDDDD"),
                #widget.TextBox("default config", name="default"),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                #widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
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
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
