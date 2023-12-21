project(darkplaces)


add_compile_options(-Wall -Winline -Werror=vla -Werror=c++-compat -Wwrite-strings -Wshadow -Wold-style-definition -Wstrict-prototypes -Wsign-compare -Wdeclaration-after-statement -Wmissing-prototypes)
add_compile_definitions(-DCONFIG_MENU -DVIDEO_CAPTURE)

find_package(SDL2 REQUIRED)

#add_library(video_capture cap_avi.c cap_ogg.c)

add_library(snd_null STATIC snd_null.c)

add_library(snd_common STATIC snd_main.c snd_mem.c snd_mix.c snd_ogg.c snd_wav.c)

set(common_source
	bih.c
	crypto.c
	cd_shared.c
	cl_cmd.c
	cl_collision.c
	cl_demo.c
	cl_ents.c
	cl_ents4.c
	cl_ents5.c
	cl_ents_nq.c
	cl_ents_qw.c
	cl_input.c
	cl_main.c
	cl_parse.c
	cl_particles.c
	cl_screen.c
	cl_video.c
	cl_video_libavw.c
	clvm_cmds.c
	cmd.c
	collision.c
	com_crc16.c
	com_ents.c
	com_ents4.c
	com_game.c
	com_infostring.c
	com_msg.c
	common.c
	console.c
	csprogs.c
	curves.c
	cvar.c
	dpvsimpledecode.c
	filematch.c
	fractalnoise.c
	fs.c
	ft2.c
	utf8lib.c
	gl_backend.c
	gl_draw.c
	gl_rmain.c
	gl_rsurf.c
	gl_textures.c
	hmac.c
	host.c
	image.c
	image_png.c
	jpeg.c
	keys.c
	lhnet.c
	libcurl.c
	mathlib.c
	matrixlib.c
	mdfour.c
	meshqueue.c
	mod_skeletal_animatevertices_sse.c
	mod_skeletal_animatevertices_generic.c
	model_alias.c
	model_brush.c
	model_shared.c
	model_sprite.c
	netconn.c
	palette.c
	phys.c
	polygon.c
	portals.c
	protocol.c
	prvm_cmds.c
	prvm_edict.c
	prvm_exec.c
	r_explosion.c
	r_lightning.c
	r_modules.c
	r_shadow.c
	r_sky.c
	r_sprites.c
	r_stats.c
	sbar.c
	sv_ccmds.c
	sv_demo.c
	sv_ents.c
	sv_ents4.c
	sv_ents5.c
	sv_ents_csqc.c
	sv_ents_nq.c
	sv_main.c
	sv_move.c
	sv_phys.c
	sv_save.c
	sv_send.c
	sv_user.c
	svbsp.c
	svvm_cmds.c
	sys_shared.c
	taskqueue.c
	vid_shared.c
	view.c
	wad.c
	world.c
	zone.c)
add_library(common_server STATIC ${common_source})

add_library(common_client STATIC ${common_source})

add_library(menu STATIC
	menu.c
	mvm_cmds.c)

#add_executable(server builddate.c sys_unix.c vid_null.c thread_null.c)# $(OBJ_SND_NULL) $(OBJ_COMMON))
#target_link_libraries(server PRIVATE -lrt -ldl -lm common_server menu snd_null ${SDL2_LIBRARIES})

add_executable(client builddate.c sys_sdl.c vid_sdl.c thread_sdl.c snd_sdl.c)# $(OBJ_MENU) $(OBJ_SND_COMMON) $(OBJ_SND_XMP) snd_sdl.c $(OBJ_VIDEO_CAPTURE) $(OBJ_COMMON)
target_include_directories(client PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(client PRIVATE -lrt -ldl -lm common_client menu snd_common ${SDL2_LIBRARIES})

