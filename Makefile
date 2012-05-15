ifeq ($(strip $(DEVKITXENON)),)
$(error "Please set DEVKITXENON in your environment. export DEVKITXENON=<path to>devkitPPC")
endif


include $(DEVKITXENON)/rules
 
export TOPDIR	:=	$(CURDIR)
 
export LIBGLOB_MAJOR	:= 1
export LIBGLOB_MINOR	:= 0
export LIBGLOB_PATCH	:= 11

export VERSTRING	:=	$(LIBGLOB_MAJOR).$(LIBGLOB_MINOR).$(LIBGLOB_PATCH)


#default: release
default: all

#all: release dist
all: xenon-release

release: include/LIBGLOBversion.h

xenon-release:
	$(MAKE) -C libxenon PLATFORM=xenon BUILD=xenon_release

#debug: nds-debug gba-debug cube-debug wii-debug
debug: 

#clean: nds-clean gba-clean ogc-clean
clean: 

dist: include/LIBGLOBversion.h dist-bin dist-src

distribute/$(VERSTRING):
	@[ -d $@ ] || mkdir -p $@

include/LIBGLOBversion.h : Makefile
	@echo "#ifndef __LIBGLOBVERSION_H__" > $@
	@echo "#define __LIBGLOBVERSION_H__" >> $@
	@echo >> $@
	@echo "#define _LIBGLOB_MAJOR_	$(LIBGLOB_MAJOR)" >> $@
	@echo "#define _LIBGLOB_MINOR_	$(LIBGLOB_MINOR)" >> $@
	@echo "#define _LIBGLOB_PATCH_	$(LIBGLOB_PATCH)" >> $@
	@echo >> $@
	@echo '#define _LIBGLOB_STRING "LIBGLOB Release '$(LIBGLOB_MAJOR).$(LIBGLOB_MINOR).$(LIBGLOB_PATCH)'"' >> $@
	@echo >> $@
	@echo "#endif // __LIBGLOBVERSION_H__" >> $@

#install: nds-install gba-install ogc-install
install: 
	$(MAKE) -C libxenon install

