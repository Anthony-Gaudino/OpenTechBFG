cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)

project(OpenTechEngine)

################################################################################

option(USE_MFC_TOOLS
  "Compile the built-in MFC based tools" OFF)

option(MONOLITH
  "Embed game logic into main executable" ON)

option(SDL2
  "Use SDL2 instead of SDL1.2" OFF)

option(OPENAL
  "Use OpenAL soft instead of XAudio2" OFF)


option(OPENAL
  "Use OpenAL soft instead of XAudio2" OFF)

if(NOT MSVC)
  # on other platforms we must use openal because they don't have xaudio - and mingw is missing XAudio2.h
  # FIXME: can we somehow have it default to OFF on windows and ON everywhere else?
  set(OPENAL TRUE)
endif()

option(FFMPEG
  "Use FMPEG to render Bink videos" OFF)

option(IDTOOLS
  "Compile the built-in game tools" ON)

option(CEGUI
  "Use cegui" ON)

#options########################################################################




# FIXME: should autodetect if there is a version available by CMake and use that if yes?

option(BUNDLED_JPEG
  "Use bundled libjpeg" ON)

option(BUNDLED_PNG
  "Use bundled libpng" ON)

option(BUNDLED_ZLIB
  "Use bundled zlib" ON)

option(BUNDLED_MINIZIP
  "Use bundled minizip" ON)

option(BUNDLED_IRRXML
  "Use bundled irrxml" OFF)

option(BUNDLED_GLEW
  "Use bundled glew" ON)

option(BUNDLED_FREETYPE
  "Use bundled freetype")

option(BUNDLED_OGGVORBIS
  "Use bundled oggvorbis" OFF)
  
option(BUNDLED_OPENAL
  "Use bundled openal")

option(BUNDLED_SDL
  "Use bundled SDL" OFF)

option(BUNDLED_CEGUI
  "Use bundled CEGUI" ON)

  
################################################################################

message(STATUS CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE})

###############

# libjpeg
if(BUNDLED_JPEG)
  add_subdirectory(libs/jpeg)
endif()

# zlib and minizip
if(BUNDLED_ZLIB)
  add_subdirectory(libs/zlib)
endif()

# libpng
if(BUNDLED_PNG)	
  add_subdirectory(libs/png)
endif()

# glew
if(BUNDLED_GLEW)
  add_subdirectory(libs/glew)
endif()

# freetype
if(BUNDLED_FREETYPE)
  add_subdirectory(libs/freetype)
endif()

# openal
if(BUNDLED_OPENAL)
#  add_subdirectory(libs/openal)
endif()

# sdl
if(BUNDLED_SDL)
#  add_subdirectory(libs/sdl)
endif()

# cegui
if(BUNDLED_CEGUI)
  # set RPATH for Unix-y systems (except for OS X), so they can find the cegui libs.
  # must be done here so it's used for both the OpenTech executable and the cegui libs
  if(UNIX AND NOT APPLE AND NOT WIN32)
    # use $ORIGIN/lib as RPATH to have a relative rpath (lib/ should always be next to the executable)
    set(CMAKE_INSTALL_RPATH "\$ORIGIN/lib")
    # this RPATH should be used immediately, not only after installing
    set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)
  endif()

  add_subdirectory(libs/cegui)
endif()

####

add_subdirectory(neo)
