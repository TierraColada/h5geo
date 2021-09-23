
#ifndef H5GEO_EXPORT_H
#define H5GEO_EXPORT_H

#ifdef H5GEO_STATIC_DEFINE
#  define H5GEO_EXPORT
#  define H5GEO_NO_EXPORT
#else
#  ifndef H5GEO_EXPORT
#    ifdef h5geo_EXPORTS
        /* We are building this library */
#      define H5GEO_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define H5GEO_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef H5GEO_NO_EXPORT
#    define H5GEO_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef H5GEO_DEPRECATED
#  define H5GEO_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef H5GEO_DEPRECATED_EXPORT
#  define H5GEO_DEPRECATED_EXPORT H5GEO_EXPORT H5GEO_DEPRECATED
#endif

#ifndef H5GEO_DEPRECATED_NO_EXPORT
#  define H5GEO_DEPRECATED_NO_EXPORT H5GEO_NO_EXPORT H5GEO_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef H5GEO_NO_DEPRECATED
#    define H5GEO_NO_DEPRECATED
#  endif
#endif

#endif /* H5GEO_EXPORT_H */
