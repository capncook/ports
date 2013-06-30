# Last Edited: 01/07/2013
# CROSSING

#OPSYS
#OSREL
#OSVERSION
PKGNAMESUFFIX=+${TARGET_ARCH}
## STAGINGDIR AND PATCHING
UNIQUENAME=+${TARGET_ARCH}
#restriCTIVE_FILES
NO_CDROM=
CATEGORIES=+${TARGET_ARCH} Embedded
# ARCH SPECIFIC PATCH DETECTION AND EDIT OR DISCULSION
MAINTAINER=masterrootpuppetchefgodhead@gmail.com
#is_interactive
#unset NO_PACKAGE
#.if (defined(MANUAL_PACKAGE_BUILD) && defined(PACKAGE_BUILDING))

cross-env-vars:

NOPORTSDOCS=
#STRIP
# SHAREDLIBS
# NOLICENSE
#NOMAN=
#NOINFO=

#pre-configure:
#.for deptype in lib run
#.if make(${deptype}-depends)

.if defined(GNU_CONFIGURE)
CONFIGURE_TARGET=${TARGET_ARCH}
GNU_CONFIGURE_PREFIX=/opt
.endif

.if !defined(HAS_CONFIGURE) && !defined(GNU_CONFIGURE) && defined(USE_GMAKE) && defined(USE_GCC)
MAKE_ARGS+=     ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_ARCH}-portbld-freebsd${OSREL} # -$$i
.endif

.if !defined(GNU_CONFIGURE) && defined(USE_GMAKE) && !defined(USE_GCC)
MAKE_ARGS+=     ARCH=${TARGET_ARCH}
.endif

.if !defined(USE_GCC)
#CFLAGS+=        -arch ${TARGET_ARCH} -mcpu ${TARGET_ARCH}
#-ccc-host-triple ${TARGET_ARCH}-freebsd${OSREL}
# -ccc ${TARGET_ARCH}
.endif

PREFIX=/opt

CROSS_ENV_LIST=CFLAGS MAKE_ARGS CONFIGURE_TARGET

DEPENDS_ARGS=	PREFIX CONFIGURE_HOST MAKE_ARGS CFLAGS

#DESTDIR_ENV_LIST=TARGET TARGET_ARCH CFLAGS MAKE_ARGS CONFIGURE_HOST
# CHROOTED=no DESTDIR=/usr/obj/${TARGET}.${TARGET_ARCH}/root

#Check if xdev ${TARGET}-gcc and other tools are installed else give error
#message and instructions to install xdev for relevent arch
.if defined(USE_GCC)
.if !exist(/usr/${TARGET_ARCH}-freebsd}
#       echo "This port requires GCC and related Cross Compiling Environment Tools \
#       These can be installed from FreeBSD sources. \
#       Make sure you have the FreeBSD sources and run: \
#       cd /usr/src && make XDEV=${TARGET} XDEV_ARCH=${TARGET_ARCH} install \
#       then try again."
.endif
.endif

#MAKEFLAGS=CFLAGS MAKE_ARGS CONFIGURE_HOST

#.endif
