# strdup.m4 serial 11

dnl Copyright (C) 2002-2010 Free Software Foundation, Inc.

dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

AC_DEFUN([gl_FUNC_STRDUP],
[
  AC_REQUIRE([gl_HEADER_STRING_H_DEFAULTS])
  AC_REPLACE_FUNCS([strdup])
  AC_CHECK_DECLS_ONCE([strdup])
  if test $ac_cv_have_decl_strdup = no; then
    HAVE_DECL_STRDUP=0
  fi
  gl_PREREQ_STRDUP
])

AC_DEFUN([gl_FUNC_STRDUP_POSIX],
[
  AC_REQUIRE([gl_HEADER_STRING_H_DEFAULTS])
  AC_REQUIRE([gl_CHECK_MALLOC_POSIX])
  if test $gl_cv_func_malloc_posix != yes; then
    REPLACE_STRDUP=1
    AC_LIBOBJ([strdup])
  else
    AC_REPLACE_FUNCS([strdup])
  fi
  AC_CHECK_DECLS_ONCE([strdup])
  if test $ac_cv_have_decl_strdup = no; then
    HAVE_DECL_STRDUP=0
  fi
  gl_PREREQ_STRDUP
])

# Prerequisites of lib/strdup.c.
AC_DEFUN([gl_PREREQ_STRDUP], [:])
