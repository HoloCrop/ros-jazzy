
rm -rf build
mkdir build
cd build

export CMAKE_BUILD_PARALLEL_LEVEL=4
cmake \
  -G "Ninja" \
  -DCMAKE_CXX_FLAGS="-Wno-error=array-bounds" \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DBUILD_SHARED_LIBS=ON  \
  -DCMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP=True \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_BUILD_TYPE=Release \
  -DGTSAM_USE_SYSTEM_EIGEN=ON \
  -DBUILD_TESTING=OFF \
  $SRC_DIR/$PKG_NAME
cmake --build . --config Release -j 4 --target install
