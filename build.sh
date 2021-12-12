
readonly PROJECT_DIR="$(pwd)"
readonly BUILD_DIR="${PROJECT_DIR}/build"
readonly DEPOT_TOOLS_DIR="${PROJECT_DIR}/depot_tools"
readonly SKIA_DIR="${PROJECT_DIR}/skia"

echo "Building Skia from ${PROJECT_DIR}"
echo "Using depot tools in ${DEPOT_TOOLS_DIR}"
echo "Using Skia in ${SKIA_DIR}"
echo "Building in ${BUILD_DIR}"

# Put depot_tools in the path
export PATH="${DEPOT_TOOLS_DIR}:${PATH}"

# Build Skia for ios
# echo "Building Skia for ios"
# cd "${SKIA_DIR}"
# ./bin/gn gen "${BUILD_DIR}" --args='target_os="ios" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false'
# ninja -C "${BUILD_DIR}" -j2
# cd "${PROJECT_DIR}"


# Build Skia for mac
echo "Building Skia for mac"
cd "${SKIA_DIR}"
./bin/gn gen "${BUILD_DIR}" --args='target_os="mac" target_cpu="x64" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false'
ninja -C "${BUILD_DIR}" -j2
cd "${PROJECT_DIR}"