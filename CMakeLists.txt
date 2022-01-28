cmake_minimum_required( VERSION 3.10 )

project( stress LANGUAGES C
    VERSION 2.0.8  
)


message( "build type: ${CMAKE_BUILD_TYPE}" )

# ===== Global cmake configureations =====

add_compile_options( -Werror=return-type )


set( CMAKE_CXX_STANDARD 14 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_CXX_EXTENSIONS OFF )



add_definitions(-D_ENABLE_EXTENDED_ALIGNED_STORAGE -D_ARK_EDGE)
add_compile_definitions(PACKAGE="WUT_PACKAGE")
add_compile_definitions(VERSION="WUT_V")


# ============ Build the executable ============
add_executable(stress 
  ${PROJECT_SOURCE_DIR}/jni/stress.c
)
target_link_libraries(stress
m
)

#install(TARGETS stress DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/install/)
