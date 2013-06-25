pre-configure:

.if defined(GNU_CONFIGURE)
CONFIGURE_HOST?=        ${TARGET_ARCH}-portbld-freebsd${OSREL}
.endif

.if !defined(HAS_CONFIGURE) && !defined(GNU_CONFIGURE) && defined(USE_GMAKE) && defined(USE_GCC)
MAKE_ARGS+=     ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_ARCH}-freebsd${OSREL}-$$i
.endif

pre-build:

.if !defined(GNU_CONFIGURE) && defined(USE_GMAKE) && !defined(USE_GCC)
MAKE_ARGS+=     ARCH=${TARGET_ARCH}
.endif

.if !defined(USE_GCC)
CFLAGS+=        -arch ${TARGET_ARCH} -mcpu ${TARGET_CPUARCH}
.endif

CROSS_ENV_LIST=CFLAGS MAKE_ARGS CONFIGURE_HOST

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
