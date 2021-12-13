
readonly PROJECT_DIR="$(pwd)"
 BUILD_DIR="${PROJECT_DIR}/build"
readonly DEPOT_TOOLS_DIR="${PROJECT_DIR}/depot_tools"
readonly SKIA_DIR="${PROJECT_DIR}/skia"
readonly RELEASE_DIR="${PROJECT_DIR}/release"

echo "Building Skia from ${PROJECT_DIR}"
echo "Using depot tools in ${DEPOT_TOOLS_DIR}"
echo "Using Skia in ${SKIA_DIR}"
echo "Building in ${BUILD_DIR}"

# Put depot_tools in the path
export PATH="${DEPOT_TOOLS_DIR}:${PATH}"

# copy_libraries_in_place() {
#   local dir=$1
#   local platform=$2
#   local arch=$3
#   echo 'Copying libraries in place...'
#   mkdir -p "${RELEASE_DIR}/${platform}/${arch}"
#   for file in $(find "${dir}" -name '*.a'); do
#     cp -n "${file}" "${RELEASE_DIR}/${platform}/${arch}"
#   done
# }

# # Build Skia for iphonesimulator
# echo "Building Skia for iphonesimulator"
# cd "${SKIA_DIR}"
# BUILD_DIR="${BUILD_DIR}/iphonesimulator"
# ./bin/gn gen "${BUILD_DIR}" --args='target_os="ios" target_cpu="x64" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false'
# ninja -C "${BUILD_DIR}" -j2
# cd "${PROJECT_DIR}"
# copy_libraries_in_place "${BUILD_DIR}" 'ios' 'x86_64'

# # Build Skia for ios
# echo "Building Skia for ios"
# cd "${SKIA_DIR}"
# BUILD_DIR="${BUILD_DIR}/ios"
# ./bin/gn gen "${BUILD_DIR}" --args='target_os="ios" target_cpu="arm" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false'
# ninja -C "${BUILD_DIR}" -j2
# cd "${PROJECT_DIR}"
# copy_libraries_in_place "${BUILD_DIR}" 'ios' 'x86_64'


# Build Skia for mac
echo "Building Skia for mac"
cd "${SKIA_DIR}"
BUILD_DIR="${BUILD_DIR}/mac"
./bin/gn gen "${BUILD_DIR}" --args='target_os="mac" target_cpu="x64" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false' --ide=xcode
ninja -C "${BUILD_DIR}" -j2
cd "${PROJECT_DIR}"
copy_libraries_in_place "${BUILD_DIR}" 'osx' 'x86_64'

# # Build Skia for mac-i386
# echo "Building Skia for mac-i386"
# cd "${SKIA_DIR}"
# BUILD_DIR="${BUILD_DIR}/mac-i386"
# ./bin/gn gen "${BUILD_DIR}" --args='target_os="mac" target_cpu="i386" is_official_build=true skia_use_system_libwebp=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_system_harfbuzz=false skia_pdf_subset_harfbuzz=true skia_use_metal=true skia_enable_skottie=false'
# ninja -C "${BUILD_DIR}" -j2
# cd "${PROJECT_DIR}"
# copy_libraries_in_place "${BUILD_DIR}" 'osx' 'i386'

