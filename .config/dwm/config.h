/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows */
static const unsigned int gappov    = 10;       /* vert outer gap between windows */
static const int smartgaps          = 0;        /* 1 = no outer gaps on single win*/
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
/* static const int tbpad              = 8;        */
/* static const int lrpad              = 20;       */
static const char *fonts[]          = { "Input Mono:size=12", "Input Serif:size=12", "Font Awesome:size=12", "Joypixels:size=12" };
static const char dmenufont[]       = "Input Mono:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_thinkpad[]    = "#e60012";
static const char *colors[][3]      = {
    /*                fg         bg             border   */
    [SchemeNorm]  = { col_gray3, col_gray1,     col_gray2    },
    [SchemeSel]   = { col_gray4, col_thinkpad,  col_thinkpad },
    /* [SchemeTitle] = { col_gray4, col_gray1,     col_gray1    }, */
};

/* tagging */
static const char *tags[] = { "", "", "", "",  "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "| ",      tile },    /* first entry is default */
	{ "| ",      NULL },    /* no layout function means floating behavior */
	{ "| ",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_thinkpad, "-sf", col_gray4, NULL };
static const char *filemanagercmd[]  = { "alacritty", "-e", "/home/mt/.config/vifm/scripts/vifmrun" };
static const char *termcmd[]  = { "alacritty", NULL };

#include <X11/XF86keysym.h>

static Key keys[] = {
	/* modifier           key                       function        argument */
	{ MODKEY,             XK_e,                     spawn,          {.v = filemanagercmd} },
	{ MODKEY,             XK_p,                     spawn,          SHCMD("rofi -font \"Input Mono 16\" -show drun -icon-theme \"Papirus\" -show-icons") },
	{ MODKEY|ShiftMask,   XK_Return,                spawn,          {.v = termcmd } },
	{ MODKEY,             XK_w,                     spawn,          SHCMD("qutebrowser") },
	{ MODKEY|ShiftMask,   XK_w,                     spawn,          SHCMD("qutebrowser :command \":open -p\"") },
    { MODKEY,			  XK_c,	                    spawn,          SHCMD("alacritty -e nvim ~/.config") },
	{ 0,                  XF86XK_MonBrightnessUp,	spawn,          SHCMD("light -A 1") },
	{ 0,                  XF86XK_MonBrightnessDown,	spawn,          SHCMD("light -U 1") },
	{ 0,                  XF86XK_AudioMute,		    spawn,          SHCMD("amixer -q sset Master toggle") },
	{ 0,                  XF86XK_AudioRaiseVolume,	spawn,          SHCMD("amixer -q sset Master 5%+") },
	{ 0,                  XF86XK_AudioLowerVolume,	spawn,          SHCMD("amixer -q sset Master 5%-") },
	{ 0,                  XF86XK_AudioMicMute,	    spawn,          SHCMD("amixer -q sset Capture toggle") },
	{ 0,                  XK_Print,	                spawn,          SHCMD("maim ~/Pictures/pic-full-$(date '+%y%m%d-%H%M-%S').png") },
	{ ShiftMask,          XK_Print,                 spawn,          SHCMD("maimpick") },
	{ MODKEY,             XK_Print,                 spawn,          SHCMD("ffmpeg -video_size \"$(xdpyinfo | grep dimensions | awk '{print $2;}')\" -framerate 25 -f x11grab -i \"$DISPLAY\" -f alsa -ac 2 -i hw:0 \"$HOME/Videos/video-$(date '+%y%m%d-%H%M-%S').mkv\"") },
	{ MODKEY,             XK_Delete,	            spawn,		    SHCMD("killall ffmpeg") },
	{ MODKEY,             XK_b,                     togglebar,      {0} },
	{ MODKEY,             XK_j,                     focusstack,     {.i = +1 } },
	{ MODKEY,             XK_k,                     focusstack,     {.i = -1 } },
	{ MODKEY,             XK_i,                     incnmaster,     {.i = +1 } },
	{ MODKEY,             XK_d,                     incnmaster,     {.i = -1 } },
	{ MODKEY,             XK_h,                     setmfact,       {.f = -0.05} },
	{ MODKEY,             XK_l,                     setmfact,       {.f = +0.05} },
	{ MODKEY,             XK_Return,                zoom,           {0} },
	{ MODKEY,             XK_Tab,                   view,           {0} },
	{ MODKEY,             XK_q,                     killclient,     {0} },
	{ MODKEY,             XK_t,                     setlayout,      {.v = &layouts[0]} },
	{ MODKEY,             XK_f,                     setlayout,      {.v = &layouts[1]} },
	{ MODKEY,             XK_m,                     setlayout,      {.v = &layouts[2]} },
	{ MODKEY,             XK_space,                 setlayout,      {0} },
	{ MODKEY|ShiftMask,   XK_space,                 togglefloating, {0} },
	{ MODKEY,             XK_0,                     view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,   XK_0,                     tag,            {.ui = ~0 } },
	{ MODKEY,             XK_comma,                 focusmon,       {.i = -1 } },
	{ MODKEY,             XK_period,                focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,   XK_comma,                 tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,   XK_period,                tagmon,         {.i = +1 } },
	TAGKEYS(              XK_1,                                     0)
	TAGKEYS(              XK_2,                                     1)
	TAGKEYS(              XK_3,                                     2)
	TAGKEYS(              XK_4,                                     3)
	TAGKEYS(              XK_5,                                     4)
	{ MODKEY|ShiftMask,   XK_q,                     quit,           {0} },
};
/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

