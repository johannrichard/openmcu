AC_PLUGIN_DIR=codecs/audio
prefix=/opt/openmcu-ru/lib/ptlib
target_os=linux-gnu

SONAME    = speex

OBJDIR	  = ./obj
PLUGINDIR = ../..

CC		=gcc
CXX		=g++
LDSO		=-shared -Wl,-soname,$(SONAME)
PLUGINEXT	=so
CFLAGS	       +=-g -O2 
STDCCFLAGS	=-fPIC -D__STDC_CONSTANT_MACROS -D USE_KISS_FFT=1 -D EXPORT= -D FIXED_POINT=1
LDFLAGS	       += -L/usr/lib -lspeex
CPPFLAGS       += -I/usr/include
OPTCCFLAGS      =$(CPPFLAGS)
EXTRACFLAGS     =

SRCS 		=speexcodec.cxx


vpath	%.o $(OBJDIR)
vpath	%.cxx .

ifeq ($(VERBOSE),)
Q_CC = @echo [CC] `echo $< | sed s^@OPALDIR@/^^` ;
Q_LD = @echo [LD] `echo $(PLUGIN) | sed s^@OPALDIR@/^^` ;
endif


$(OBJDIR)/%.o : %.c
	@mkdir -p $(OBJDIR) >/dev/null 2>&1
	$(Q_CC)$(CC) -I../../../include $(STDCCFLAGS) $(OPTCCFLAGS) $(EXTRACFLAGS) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o : %.cxx
	@mkdir -p $(OBJDIR) >/dev/null 2>&1
	$(CXX) $(EXTRACCFLAGS) $(STDCCFLAGS) $(OPTCCFLAGS) $(CFLAGS) -c $< -o $@

PLUGIN	= ./$(SONAME)_audio_pwplugin.$(PLUGINEXT)

OBJECTS = $(addprefix $(OBJDIR)/,$(patsubst %.c,%.o,$(patsubst %.cxx,%.o,$(notdir $(SRCS)))))


all: $(PLUGIN)

$(PLUGIN): $(OBJECTS)
ifeq (solaris,$(findstring solaris,$(target_os)))

	$(Q_LD)$(CXX) $(LDSO) $@ -o $@ $^ $(EXTRALIBS) $(LDFLAGS)
else
	$(Q_LD)$(CXX) $(LDSO) -o $@ $^ $(EXTRALIBS) $(LDFLAGS)

endif	

install:
	mkdir -p $(DESTDIR)$(prefix)/$(AC_PLUGIN_DIR)
	install $(PLUGIN) $(DESTDIR)$(prefix)/$(AC_PLUGIN_DIR)

uninstall:
	rm -f $(DESTDIR)$(prefix)/$(AC_PLUGIN_DIR)/$(PLUGIN)

clean:
	rm -f $(OBJECTS) $(PLUGIN)

###########################################
