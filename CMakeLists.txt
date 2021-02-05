cmake_minimum_required(VERSION 3.5)

project(QCalc LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick QuickControls2 LinguistTools REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick QuickControls2 LinguistTools REQUIRED)

#find_package(Qt6 COMPONENTS Core Quick QuickControls2 LinguistTools)
#if(NOT Qt6_FOUND)
#    find_package(Qt5 COMPONENTS Core Quick QuickControls2 LinguistTools REQUIRED)
#endif()

set(TS_FILES QCalc_en_US.ts)

set(SRC
      StandardDistribution.cpp
      main.cpp
      mainwindow.cpp
      QStatistics.cpp
)

set(QRC
    qml.qrc
)

# make sure that Windows doesn't display a console
if(WIN32)
    set(IS_WIN "WIN32")
else()
    set(IS_WIN "")
endif()

if(ANDROID)
    add_library(QCalc SHARED
        ${SRC}
        ${QRC}
        ${TS_FILES}
    )
else()
    add_executable(QCalc
        ${IS_WIN}
        ${SRC}
        ${QRC}
        ${TS_FILES}
    )
endif()

target_compile_definitions(QCalc
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(QCalc
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::QuickControls2)

if (${QT_VERSION_MAJOR} STREQUAL "5")
    qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
else()
    qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
endif()
