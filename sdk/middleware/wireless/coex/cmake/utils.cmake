# Copyright 2022-2024 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
# The BSD-3-Clause license can be found at https://spdx.org/licenses/BSD-3-Clause.html

macro(get_all_targets_recursive targets dir)
    get_property(subdirectories DIRECTORY ${dir} PROPERTY SUBDIRECTORIES)
    foreach(subdir ${subdirectories})
        get_all_targets_recursive(${targets} ${subdir})
    endforeach()

    get_property(current_targets DIRECTORY ${dir} PROPERTY BUILDSYSTEM_TARGETS)
    list(APPEND ${targets} ${current_targets})
endmacro()

function(get_all_targets var)
    set(targets)
    get_all_targets_recursive(targets ${CMAKE_CURRENT_SOURCE_DIR})
    set(${var} ${targets} PARENT_SCOPE)
endfunction()

function(export_target_to_bin target)
    get_target_property(type ${target} TYPE)
    if(type MATCHES "EXECUTABLE")
        # message(STATUS "Target ${target} will be exported to raw binary format")
        set(target_bin_filename ${target}.bin)
        add_custom_command(
            OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_bin_filename}
            COMMAND ${CMAKE_OBJCOPY} ARGS -v -O binary ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target}${CMAKE_EXECUTABLE_SUFFIX_C} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_bin_filename}
            DEPENDS ${target}
        )
        add_custom_target(export_${target}_to_bin ALL
            DEPENDS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_bin_filename}
        )
    endif()
endfunction()

function(export_target_to_srec target)
    get_target_property(type ${target} TYPE)
    if(type MATCHES "EXECUTABLE")
        # message(STATUS "Target ${target} will be exported to srec format")
        set(target_srec_filename ${target}.srec)
        add_custom_command(
            OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_srec_filename}
            COMMAND ${CMAKE_OBJCOPY} ARGS -v -O srec ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target}${CMAKE_EXECUTABLE_SUFFIX_C} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_srec_filename}
            DEPENDS ${target}
        )
        add_custom_target(export_${target}_to_srec ALL
            DEPENDS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_srec_filename}
        )
    endif()
endfunction()

function(export_all_targets_to_bin)
    get_all_targets(all_targets)
    foreach(target ${all_targets})
        export_target_to_bin(${target})
    endforeach()
endfunction()

function(export_all_targets_to_srec)
    get_all_targets(all_targets)
    foreach(target ${all_targets})
        export_target_to_srec(${target})
    endforeach()
endfunction()

function(run_post_build_command)
    get_all_targets(all_targets)
    foreach(target ${all_targets})
        get_target_property(type ${target} TYPE)
        if(type MATCHES "EXECUTABLE")
            list(APPEND executable_targets ${target})
        endif()
    endforeach()
    add_custom_command(
        OUTPUT post_build.output
        COMMAND ${COEX_NXP_POST_BUILD_COMMAND} ARGS ${COEX_NXP_POST_BUILD_COMMAND_ARGS}
        DEPENDS ${executable_targets}
        COMMENT "Running post build command: ${COEX_NXP_POST_BUILD_COMMAND} ${COEX_NXP_POST_BUILD_COMMAND_ARGS}"
    )
    add_custom_target(post_build_command ALL
        DEPENDS post_build.output
    )
endfunction()

function(otnxp_git_version git_version)
    execute_process(
        COMMAND git describe --dirty --always --exclude "*"
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_REV_OTNXP OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
    )

    execute_process(
        COMMAND git describe --dirty --always --exclude "*"
        WORKING_DIRECTORY ${WORKING_DIRECTORY_PATH}
        OUTPUT_VARIABLE GIT_REV_OT OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(${git_version} "${GIT_REV_OT} OT-NXP/${GIT_REV_OTNXP}" PARENT_SCOPE)
endfunction()