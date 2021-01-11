/// @description GameMenu
scr_start_game();
global.pause			= true;
global.view_widt		= camera_get_view_width(view_camera[0]);
global.view_height		= camera_get_view_height(view_camera[0]);

///Transition Global Vars
global.TargetRoom = -1;
global.TargetX = -1;
global.TargetY = -1;
global.TargetDirection = 0;



///GLOBAL VARS
global.key_openMenu = vk_escape;


//global.key_revert		= ord("x");
global.key_enter		= vk_enter;
global.key_left			= vk_left;
global.key_right		= vk_right;
global.key_up			= vk_up;
global.key_down			= vk_down;
global.key_openMenu		= vk_escape;

display_set_gui_size(global.view_widt, global.view_height);
//with the enum function you create an array, where instead of number(0,1,2),
//it assigns numbers [] to the entries and fills the entry with given argument
enum menu_page{
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}

enum menu_element_type{
	scriptrunner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

///CREATE MENU PAGES
ds_menu_main = scr_create_menu_page(
	["RESUME"		,	menu_element_type.scriptrunner	,		scr_resume_game			],
	["SETTINGS"		,	menu_element_type.page_transfer	,		menu_page.settings	],
	["EXIT"			,	menu_element_type.scriptrunner	,		scr_exit_game			]
);

ds_settings = scr_create_menu_page(
	["AUDIO"		,	menu_element_type.page_transfer	,		menu_page.audio		],
	["GRAPHICS"		,	menu_element_type.page_transfer	,		menu_page.graphics	],
	["CONTROLS"		,	menu_element_type.page_transfer	,		menu_page.controls	],
	["BACK"			,	menu_element_type.page_transfer	,		menu_page.main		]
);

ds_menu_audio = scr_create_menu_page(
	["MASTER"		,	menu_element_type.slider		,	scr_change_volume			,	1		,	[0,1]],
	["SOUNDS"		,	menu_element_type.slider		,	scr_change_volume			,	1		,	[0,1]],
	["MUSIC"		,	menu_element_type.slider		,	scr_change_volume			,	1		,	[0,1]],
	["BACK"			,	menu_element_type.page_transfer	,	menu_page.settings		]
);

ds_menu_graphics = scr_create_menu_page(
	["RESOLUTION"	,	menu_element_type.shift			,	scr_change_resolution		,	0		,	["384 x 216", "768 x 432","1536 x 874","1920 x 1080"]],
	["WINDOW MODE"	,	menu_element_type.toggle		,	scr_change_window_mode		,	1		,	["FULLSCREEN", "WINDOWED"]],
	["BACK"			,	menu_element_type.page_transfer	,	menu_page.settings		]
);

ds_menu_controls = scr_create_menu_page(
	["UP"			,	menu_element_type.input			,	"key_up"			,	vk_up		],
	["LEFT"			,	menu_element_type.input			,	"key_left"			,	vk_left		],
	["RIGHT"		,	menu_element_type.input			,	"key_right"			,	vk_right	],
	["DOWN"			,	menu_element_type.input			,	"key_down"			,	vk_down		],
	["BACK"			,	menu_element_type.page_transfer	,	menu_page.settings		]
);

//Whenever we are on a page or transfer to another page, we lookup the grid we need in the array below
page = 0;
menu_pages = [ds_menu_main,	ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls]
//with this array we "save" where we were
var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;


///importing audiogroups like this || Check all comments with !MUSIC
//------------
//audio_group_load(/*audiogroup*/);
//----------------
