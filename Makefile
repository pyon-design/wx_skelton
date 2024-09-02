# Makefile for wxWidgets Application
# Last Change: 2023-04-20 09:41:53.
# by Tak Mutoh
#

PROGNAME = skelton

### Variables ###
OBJDIR = ./obj
CXX = g++
ARCH = _ucrt64
LOCAL = C:/msys64/home/muto/local$(ARCH)
vpath %.cpp ./src
vpath %.h   ./include

# For Microsoft Windows
ifdef COMSPEC
WXCXXFLAGS = -I$(LOCAL)/lib/wx/include/msw-unicode-static-3.2 -I$(LOCAL)/include/wx-3.2 -D_FILE_OFFSET_BITS=64 -D__WXMSW__ 
WXLIBS = -L$(LOCAL)/lib -Wl,--subsystem,windows -mwindows -lwx_mswu_xrc-3.2 -lwx_mswu_qa-3.2 -lwx_baseu_net-3.2 -lwx_mswu_html-3.2 -lwx_mswu_core-3.2 -lwx_baseu_xml-3.2 -lwx_baseu-3.2 -lwxtiff-3.2 -lwxjpeg-3.2 -lwxpng-3.2 -lwxregexu-3.2 -lwxexpat-3.2 -lwxzlib-3.2 -lrpcrt4 -loleaut32 -lole32 -luuid -luxtheme -lwinspool -lwinmm -lshell32 -lshlwapi -lcomctl32 -lcomdlg32 -ladvapi32 -lversion -lws2_32 -lgdi32 -loleacc -lwinhttp 
LIBS = $(WXLIBS) -static

EXECUTABLE = $(PROGNAME).exe

# For Apple OSX
else 
WXCXXFLAGS = -I/opt/local/Library/Frameworks/wxWidgets.framework/Versions/wxWidgets/3.2/lib/wx/include/osx_cocoa-unicode-3.2 -I/opt/local/Library/Frameworks/wxWidgets.framework/Versions/wxWidgets/3.2/include/wx-3.2 -D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXMAC__ -D__WXOSX__ -D__WXOSX_COCOA__ 
WXLIBS = -L/opt/local/Library/Frameworks/wxWidgets.framework/Versions/wxWidgets/3.2/lib -framework IOKit -framework Carbon -framework Cocoa -framework AudioToolbox -framework System -framework OpenGL -lwx_osx_cocoau_xrc-3.2 -lwx_osx_cocoau_html-3.2 -lwx_osx_cocoau_qa-3.2 -lwx_osx_cocoau_adv-3.2 -lwx_osx_cocoau_core-3.2 -lwx_baseu_xml-3.2 -lwx_baseu_net-3.2 -lwx_baseu-3.2 
LIBS = $(WXLIBS)

EXECUTABLE = $(PROGNAME).app/Contents/PkgInfo

endif

CXXFLAGS = $(WXCXXFLAGS) -I./include


OBJ = $(OBJDIR)/main.o \
	  $(OBJDIR)/skelton.o

ifdef COMSPEC
	OBJMSW = $(OBJ) $(OBJDIR)/sample_rc.o
endif


### Targets ###

all: $(EXECUTABLE)
	@echo "----------------------------"
	@echo " making $(ARCH) bit program "
	@echo "----------------------------"

$(PROGNAME): $(OBJ) $(OBJMSW)
	@echo ""
	@echo "=> $(EXECUTABLE) <="
	#$(CXX) $^ -o $@ $(LIBS)
	$(CXX) $^ -o $@ $(LIBS) 

$(OBJDIR)/main.o: main.cpp main.h skelton.h
	@echo ""
	@echo "=> main.o <="
	-mkdir -p $(OBJDIR)
	$(CXX) -c $< -o $@ $(CXXFLAGS)

$(OBJDIR)/skelton.o: skelton.cpp skelton.h
	@echo ""
	@echo "=> skelton.o <="
	$(CXX) -c $< -o $@ $(CXXFLAGS)


# for icon
ifdef COMSPEC
$(OBJDIR)/sample_rc.o: sample.rc
	windres -i sample.rc -o $@ -I$(LOCAL)/include/wx-3.2
endif

$(EXECUTABLE): $(PROGNAME)
ifdef COMSPEC
	strip --strip-all $(EXECUTABLE)
	./$(PROGNAME).exe
else
	-mkdir -p $(PROGNAME).app/Contents
	-mkdir -p $(PROGNAME).app/Contents/MacOS
	-mkdir -p $(PROGNAME).app/Contents/Resources
	
	sed -e "s/IDENTIFIER/$(PROGNAME)/" \
	-e "s/EXECUTABLE/$(PROGNAME)/" \
	-e "s/VERSION/0.0/" \
	Info.plist.in > $(PROGNAME).app/Contents/Info.plist
	
	echo "APPL????" > $(EXECUTABLE)
	
	ln -f $(PROGNAME) $(PROGNAME).app/Contents/MacOS/$(PROGNAME)
	cp -f wxmac.icns $(PROGNAME).app/Contents/Resources/wxmac.icns

	open $(PROGNAME).app
endif


# clean
clean:
	rm -f $(PROGNAME) $(PROGNAME).exe
	rm -f $(OBJDIR)/*.o
	rm -rf $(PROGNAME).app

.PHONY:	all clean

