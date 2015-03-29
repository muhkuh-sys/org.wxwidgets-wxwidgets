#! /bin/bash

# Get the root folder for the build.
BUILD_ROOT=`pwd`

tar fxj wxWidgets-3.0.2.tar.bz2
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

cd wxWidgets-3.0.2
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

#-----------------------------------------------------------------------------
#
# Build wxWidgets for windows x86.
#
mkdir -p build_win32
cd build_win32
export LDFLAGS="-static-libgcc -static-libstdc++"
../configure --host=i686-w64-mingw32 --prefix=/tmp/wxwidgets/win32/ --enable-vendor=muhkuh --disable-shared
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make install
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

pushd /tmp/wxwidgets/win32/lib
cp libwx_baseu-3.0-i686-w64-mingw32.a         libwx_baseu-3.0.a
cp libwx_baseu_net-3.0-i686-w64-mingw32.a     libwx_baseu_net-3.0.a
cp libwx_baseu_xml-3.0-i686-w64-mingw32.a     libwx_baseu_xml-3.0.a
cp libwx_mswu_adv-3.0-i686-w64-mingw32.a      libwx_mswu_adv-3.0.a
cp libwx_mswu_aui-3.0-i686-w64-mingw32.a      libwx_mswu_aui-3.0.a
cp libwx_mswu_core-3.0-i686-w64-mingw32.a     libwx_mswu_core-3.0.a
cp libwx_mswu_gl-3.0-i686-w64-mingw32.a       libwx_mswu_gl-3.0.a
cp libwx_mswu_html-3.0-i686-w64-mingw32.a     libwx_mswu_html-3.0.a
cp libwx_mswu_media-3.0-i686-w64-mingw32.a    libwx_mswu_media-3.0.a
cp libwx_mswu_propgrid-3.0-i686-w64-mingw32.a libwx_mswu_propgrid-3.0.a
cp libwx_mswu_qa-3.0-i686-w64-mingw32.a       libwx_mswu_qa-3.0.a
cp libwx_mswu_ribbon-3.0-i686-w64-mingw32.a   libwx_mswu_ribbon-3.0.a
cp libwx_mswu_richtext-3.0-i686-w64-mingw32.a libwx_mswu_richtext-3.0.a
cp libwx_mswu_stc-3.0-i686-w64-mingw32.a      libwx_mswu_stc-3.0.a
cp libwx_mswu_webview-3.0-i686-w64-mingw32.a  libwx_mswu_webview-3.0.a
cp libwx_mswu_xrc-3.0-i686-w64-mingw32.a      libwx_mswu_xrc-3.0.a
cp libwxscintilla-3.0-i686-w64-mingw32.a      libwx_mswu_scintilla-3.0.a
cp libwxscintilla-3.0-i686-w64-mingw32.a      libwx_mswu_scintilla-3.0-i686-w64-mingw32.a
popd

pushd /tmp/wxwidgets/win32
python $BUILD_ROOT/tests/mingw_dll_dependencies.py bin/wxrc-3.0 lib/*.a
if [ $STATUS -ne 0 ]; then
	exit 1
fi
popd

cd ..


#-----------------------------------------------------------------------------
#
# Build wxWidgets for windows amd64.
#
mkdir -p build_win64
cd build_win64
export LDFLAGS="-static-libgcc -static-libstdc++"
../configure --host=x86_64-w64-mingw32 --prefix=/tmp/wxwidgets/win64/ --enable-vendor=muhkuh --disable-shared
STATUS=$?
if [ $STATUS -ne 0 ]; then
	cat config.log
	exit 1
fi

make
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make install
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

pushd /tmp/wxwidgets/win64/lib
cp libwx_baseu-3.0-x86_64-w64-mingw32.a         libwx_baseu-3.0.a
cp libwx_baseu_net-3.0-x86_64-w64-mingw32.a     libwx_baseu_net-3.0.a
cp libwx_baseu_xml-3.0-x86_64-w64-mingw32.a     libwx_baseu_xml-3.0.a
cp libwx_mswu_adv-3.0-x86_64-w64-mingw32.a      libwx_mswu_adv-3.0.a
cp libwx_mswu_aui-3.0-x86_64-w64-mingw32.a      libwx_mswu_aui-3.0.a
cp libwx_mswu_core-3.0-x86_64-w64-mingw32.a     libwx_mswu_core-3.0.a
cp libwx_mswu_gl-3.0-x86_64-w64-mingw32.a       libwx_mswu_gl-3.0.a
cp libwx_mswu_html-3.0-x86_64-w64-mingw32.a     libwx_mswu_html-3.0.a
cp libwx_mswu_media-3.0-x86_64-w64-mingw32.a    libwx_mswu_media-3.0.a
cp libwx_mswu_propgrid-3.0-x86_64-w64-mingw32.a libwx_mswu_propgrid-3.0.a
cp libwx_mswu_qa-3.0-x86_64-w64-mingw32.a       libwx_mswu_qa-3.0.a
cp libwx_mswu_ribbon-3.0-x86_64-w64-mingw32.a   libwx_mswu_ribbon-3.0.a
cp libwx_mswu_richtext-3.0-x86_64-w64-mingw32.a libwx_mswu_richtext-3.0.a
cp libwx_mswu_stc-3.0-x86_64-w64-mingw32.a      libwx_mswu_stc-3.0.a
cp libwx_mswu_webview-3.0-x86_64-w64-mingw32.a  libwx_mswu_webview-3.0.a
cp libwx_mswu_xrc-3.0-x86_64-w64-mingw32.a      libwx_mswu_xrc-3.0.a
cp libwxscintilla-3.0-x86_64-w64-mingw32.a      libwx_mswu_scintilla-3.0.a
cp libwxscintilla-3.0-x86_64-w64-mingw32.a      libwx_mswu_scintilla-3.0-x86_64-w64-mingw32.a
popd

pushd /tmp/wxwidgets/win32
python $BUILD_ROOT/tests/mingw_dll_dependencies.py bin/wxrc-3.0 lib/*.a
if [ $STATUS -ne 0 ]; then
	exit 1
fi
popd

cd ../..


#-----------------------------------------------------------------------------
#
# Assemble the artifacts.
#
rm -rf build
mkdir build
cd build
cmake ../installer/ivy
STATUS=$?
if [ $STATUS -ne 0 ]; then
        exit 1
fi

make
STATUS=$?
if [ $STATUS -ne 0 ]; then
        exit 1
fi

make install
STATUS=$?
if [ $STATUS -ne 0 ]; then
        exit 1
fi

cd ..

