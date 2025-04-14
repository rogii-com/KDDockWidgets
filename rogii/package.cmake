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
            "${CMAKE_CURRENT_LIST_DIR}/include;${CMAKE_CURRENT_LIST_DIR}/include/kddockwidgets-qt6"

        INTERFACE_LINK_LIBRARIES
            "Qt6::Widgets;\$<LINK_ONLY:Qt6::GuiPrivate>;\$<LINK_ONLY:Dwmapi>"

        IMPORTED_LOCATION_DEBUG
            ${CMAKE_CURRENT_LIST_DIR}/lib/kddockwidgets-qt61d.lib

        IMPORTED_LOCATION
            ${CMAKE_CURRENT_LIST_DIR}/lib/kddockwidgets-qt61.lib
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
        KDAB::DockWidgets
        PROPERTIES

        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/include;${CMAKE_CURRENT_LIST_DIR}/include/kddockwidgets-qt6"

        IMPORTED_LOCATION_DEBUG
            ${CMAKE_CURRENT_LIST_DIR}/lib/libkddockwidgets-qt6d.a
        IMPORTED_LOCATION
            ${CMAKE_CURRENT_LIST_DIR}/lib/libkddockwidgets-qt6.a
    )
endif()
