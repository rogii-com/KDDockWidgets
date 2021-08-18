if(TARGET KDAB::DockWidgets)
   return()
endif()

add_library(
    KDAB::DockWidgets
    STATIC
    IMPORTED
)

if(MSVC)
    set_target_properties(
        KDAB::DockWidgets
        PROPERTIES

        INTERFACE_COMPILE_DEFINITIONS
            "KDDOCKWIDGETS_STATICLIB"

        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include;${CMAKE_CURRENT_LIST_DIR}/include/kddockwidgets"

        INTERFACE_LINK_LIBRARIES
            "Qt5::Widgets;\$<LINK_ONLY:Qt5::GuiPrivate>;\$<LINK_ONLY:Dwmapi>"

        IMPORTED_LOCATION_DEBUG
            ${CMAKE_CURRENT_LIST_DIR}/lib/kddockwidgets1d.lib

        IMPORTED_LOCATION
            ${CMAKE_CURRENT_LIST_DIR}/lib/kddockwidgets1.lib
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
        KDAB::DockWidgets
        PROPERTIES

        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include;${CMAKE_CURRENT_LIST_DIR}/include/kddockwidgets"

        IMPORTED_LOCATION_DEBUG
            ${CMAKE_CURRENT_LIST_DIR}/lib/libkddockwidgetsd.a
        IMPORTED_LOCATION
            ${CMAKE_CURRENT_LIST_DIR}/lib/libkddockwidgets.a
    )
endif()