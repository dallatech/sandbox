set(THRIFT_DEFINITION ${PROJECT_SOURCE_DIR}/api/resource/calculator.thrift)

# Destination for generated files
set(GENERATED_INCLUDE_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_CFG_INTDIR}/api_generated)
set(GENERATED_OUTPUT_DIR ${GENERATED_INCLUDE_DIR}/calculator/api)

set(
    GENERATED_SOURCE
    ${GENERATED_OUTPUT_DIR}/Calculator.cpp
    ${GENERATED_OUTPUT_DIR}/calculator_constants.cpp
    ${GENERATED_OUTPUT_DIR}/calculator_types.cpp)

add_custom_command(
    OUTPUT ${GENERATED_SOURCE}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${GENERATED_OUTPUT_DIR}
    COMMAND thrift -out ${GENERATED_OUTPUT_DIR} --gen cpp ${THRIFT_DEFINITION}
    DEPENDS ${THRIFT_DEFINITION}
)

add_library(api ${GENERATED_SOURCE})

target_include_directories(
    api
    PUBLIC ${GENERATED_INCLUDE_DIR}
)
