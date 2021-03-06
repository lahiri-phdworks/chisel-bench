# link.m4 serial 4
dnl Copyright (C) 2009 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

AC_DEFUN([gl_FUNC_LINK],
[
  AC_REQUIRE([gl_UNISTD_H_DEFAULTS])
  AC_CHECK_FUNCS_ONCE([link])
  if test $ac_cv_func_link = no; then
    HAVE_LINK=0
    AC_LIBOBJ([link])
  else
    AC_CACHE_CHECK([whether link handles trailing slash correctly],
      [gl_cv_func_link_works],
      [touch conftest.a
       # Assume that if we have lstat, we can also check symlinks.
       if test $ac_cv_func_lstat = yes; then
         ln -s conftest.a conftest.lnk
       fi
       AC_RUN_IFELSE(
         [AC_LANG_PROGRAM(
           [[#include <unistd.h>
]], [[if (!link ("conftest.a", "conftest.b/")) return 1;
#if HAVE_LSTAT
      if (!link ("conftest.lnk/", "conftest.b")) return 2;
#endif
           ]])],
         [gl_cv_func_link_works=yes], [gl_cv_func_link_works=no],
         [gl_cv_func_link_works="guessing no"])
       rm -f conftest.a conftest.b conftest.lnk])
    if test "$gl_cv_func_link_works" != yes; then
      REPLACE_LINK=1
      AC_LIBOBJ([link])
    fi
  fi
])
