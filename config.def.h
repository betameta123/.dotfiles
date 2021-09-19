/* See LICENSE file for copyright and license details. */
/* appearance */ static const unsigned int borderpx  = 1;        /* border pixel of windows */ static const unsigned int snap      = 32;       /* snap pixel */ static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar*/
static const int user_bh            = 30;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char *fonts[]          = { "Fira Code:size=10"};
static const char dmenufont[]       = "Fira Code:size=10";
static const char col1[]       = "#060E25";
static const char col2[]       = "#112761";
static const char col3[]       = "#4F92B8";
static const char col4[]       = "#B0C8DA";
static const char col[]        = "#ff601d";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col3, col2, col1 },
	[SchemeSel]  = { col4, col,  col2  },
	[SchemeStatus]  = { col3, col2,  "#000000"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col3, col2,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
    [SchemeTagsNorm]  = { col4, col1,  "#000000"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]  = { col3, col2,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
    [SchemeInfoNorm]  = { col4, col1,  "#000000"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "♚", "♛", "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title                 tags mask     isfloating   monitor    float x,y,w,h         floatborderpx   isterminal   noswallow      scratchkey*/
	{ "Gimp",     NULL,       NULL,                 0,            1,           -1,        50,50,500,500,        1,              0,           0,             0  },
	{ "Firefox",  NULL,       NULL,                 1 << 8,       0,           -1,        50,50,500,500,        1,              0,           -1,             0  },
	{ "kitty",    NULL,       NULL,                 0,            0,           -1,        50,50,500,500,        1,              1,           0,             0  },
	{ "texz",     NULL,       NULL,                 0,            0,           -1,        50,50,500,500,        1,              0,           -1,             0  },
	{ NULL,       NULL,       "Event Tester",       0,            0,           -1,        50,50,500,500,        1,              0,           1,             0  },
	{ NULL,       NULL,      "scratchpad",          0,            1,           -1,        640,360,1280,720,     1,              1,           0,             's'},

};
/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col1, "-nf", col4, "-sb", col2, "-sf", col3, "-h", "30", "-nhb", col1, "-nhf", col, "-shb", col2, "-shf", col, NULL };
static const char *termcmd[]  = { "kitty", NULL };

/* commands spawned when clicking statusbar, the mouse button pressed is exported as BUTTON */
static const StatusCmd statuscmds[] = {
    { "sb-music",       8 },
    { "sb-weather",     7 },
    { "sb-package",     6 },
    { "sb-memory",      5 },
    { "sb-cpu",         4 },
    { "sb-internet",    3 },
    { "sb-volume",      2 },
	{ "sb-clock",       1 },
};
static const char *statuscmd[] = { "/bin/sh", "-c", NULL, NULL };


/*First arg only serves to match against key in rules*/
static const char *scratchpadcmd[] = {"s", "kitty", "-T", "scratchpad", NULL};
static Key keys[] = {
	/* modifier                     key        function        argument */

    //Window Spawning
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },

    //Applications
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,                       XK_b,      spawn,           SHCMD("firefox") },
    { MODKEY,                       XK_g,      spawn,           SHCMD("gimp")},
    { MODKEY,                       XK_z,      spawn,           SHCMD("zathura")},
    { MODKEY,                       XK_p,      spawn,           SHCMD("bitwarden")},
    { MODKEY,                       XK_F1,     spawn,           SHCMD("discord")},
    { MODKEY,                       XK_F2,     spawn,           SHCMD("slack")},
    { MODKEY,                       XK_F3,     spawn,           SHCMD("spotify")},
    { MODKEY,                       XK_F4,     spawn,           SHCMD("pavucontrol")},
    { MODKEY,                       XK_F5,     spawn,           SHCMD("easyeffects")},

    //Scratchpads
	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },

    //Focus
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,                       XK_space,  focusmaster,    {0} },

    //Media
    { MODKEY,                       XK_m,		spawn,		SHCMD("pamixer -t; kill -36 $(pidof dwmblocks)") },
    { MODKEY,                       XK_minus,	spawn,		SHCMD("pamixer --allow-boost -d 5; kill -36 $(pidof dwmblocks)") },
    { MODKEY,                       XK_equal,	spawn,		SHCMD("pamixer --allow-boost -i 5; kill -36 $(pidof dwmblocks)") },

    //Screen Capture
    { MODKEY,   			        XK_c,	spawn,		SHCMD("~/.local/bin/maimpick") },

    //Layout
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_d,      incnmaster,     {.i = -1 } },
    { MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY|ControlMask,           XK_Return, setlayout,      {0} },
	{ MODKEY|ControlMask,		    XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },

	{ MODKEY|ControlMask,           XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ControlMask,           XK_s,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ControlMask,           XK_d,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY|ControlMask,           XK_b,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ControlMask,           XK_c,      setlayout,      {.v = &layouts[11]} },

    //Changing Monitors
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

    //Floating Windows
    { MODKEY|ControlMask,           XK_space,  togglealwaysontop, {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },

    //Gaps
	{ MODKEY|ShiftMask,             XK_equal,  incrgaps,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_minus,  incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_e,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_e,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_a,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_a,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_u,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_x,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_x,      incrovgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask|ControlMask, XK_space,  togglegaps,     {0} },
	{ MODKEY|ShiftMask|ControlMask, XK_Return, defaultgaps,    {0} },


    //Workspaces
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

    //Close
	{ MODKEY,                       XK_n,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY|ControlMask,           XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button4,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button5,        spawn,          {.v = statuscmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
