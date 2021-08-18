if(
    NOT DEFINED ROOT
    OR NOT DEFINED ARCH
)
    message(
        FATAL_ERROR
        "Assert: ROOT = ${ROOT}; ARCH = ${ARCH}"
    )
endif()

set(
    PROJECT_ROOT_PATH
    "${CMAKE_CURRENT_LIST_DIR}/.."
)

set(
    ROGII_FOLDER_PATH
    "${CMAKE_CURRENT_LIST_DIR}"
)

include(${ROGII_FOLDER_PATH}/version.cmake)

set(
    BUILD
    0
)

if(DEFINED ENV{BUILD_NUMBER})
    set(
        BUILD
        $ENV{BUILD_NUMBER}
    )
endif()

set(
    TAG
    ""
)

if(DEFINED ENV{TAG})
    set(
        TAG
        "$ENV{TAG}"
    )
else()
    find_package(
        Git
    )

    if(Git_FOUND)
        execute_process(
            COMMAND
                ${GIT_EXECUTABLE} rev-parse --short HEAD
            OUTPUT_VARIABLE
                TAG
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        set(
            TAG
            "_${TAG}"
        )
    endif()
endif()

set(
    PACKAGE_NAME
    "kddw-${KDDOCKWIDGETS_VERSION}-${ARCH}-${BUILD}${TAG}"
)

set(
    DEBUG_PATH
    "${PROJECT_ROOT_PATH}/build/debug_${ARCH}"
)

file(
    MAKE_DIRECTORY
    "${DEBUG_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -DCMAKE_INSTALL_PREFIX=${ROOT}/${PACKAGE_NAME} -DKDDockWidgets_STATIC=true -DKDDockWidgets_EXAMPLES=false -DCMAKE_BUILD_TYPE=Debug -G Ninja ${PROJECT_ROOT_PATH}
    WORKING_DIRECTORY
        "${DEBUG_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" --build . --target install
    WORKING_DIRECTORY
        "${DEBUG_PATH}"
)

set(
    RELEASE_PATH
    "${PROJECT_ROOT_PATH}/build/release_${ARCH}"
)

file(
    MAKE_DIRECTORY
    "${RELEASE_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -DCMAKE_INSTALL_PREFIX=${ROOT}/${PACKAGE_NAME} -DKDDockWidgets_STATIC=true -DKDDockWidgets_EXAMPLES=false -DCMAKE_BUILD_TYPE=RelWithDebInfo -G Ninja ${PROJECT_ROOT_PATH}
    WORKING_DIRECTORY
        "${RELEASE_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" --build . --target install
    WORKING_DIRECTORY
        "${RELEASE_PATH}"
)

file(
    COPY
        ${ROGII_FOLDER_PATH}/package.cmake
    DESTINATION
        "${ROOT}/${PACKAGE_NAME}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -E tar cf "${PACKAGE_NAME}.7z" --format=7zip -- "${PACKAGE_NAME}"
    WORKING_DIRECTORY
        "${ROOT}"
)
