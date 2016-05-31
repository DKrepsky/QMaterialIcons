# The MIT License (MIT)
#
# Copyright (c) 2016 David Krepsky
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#/

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Sample
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h++

FORMS    += mainwindow.ui

#-------------------------------------------------------------------------------
# This part loads the library.
#-------------------------------------------------------------------------------
# Include search paths.
INCLUDEPATH += $$PWD/lib
DEPENDPATH += $$PWD/lib

# Select debug or release version.
CONFIG(debug, debug|release): LIBS += -L$$PWD/lib/ -lQMaterialIconsd
else:CONFIG(release, debug|release): LIBS += -L$$PWD/lib/ -lQMaterialIcons

win32:!win32-g++ {
  # Microsoft msvc20XX config.
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/lib/QMaterialIconsd.lib
  else:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/lib/QMaterialIcons.lib
}
else {
  # GCC or mingw config.
  CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/lib/libQMaterialIconsd.a
  else:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/lib/libQMaterialIcons.a
}
