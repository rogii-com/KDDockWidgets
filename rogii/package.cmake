if(NOT TARGET KDAB::DockWidgets)

add_library(
    KDAB::DockWidgets
    STATIC
    IMPORTED
)

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
    ${CMAKE_CURRENT_LIST_DIR}/lib/debug/kddockwidgets1d.lib

    IMPORTED_LOCATION
    ${CMAKE_CURRENT_LIST_DIR}/lib/kddockwidgets1.lib
)

endif()