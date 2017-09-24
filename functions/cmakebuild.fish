function cmakebuild
    mkdir -p build
    if test ! -f build/CMakeCache.txt
        pushd build
        cmake .. ;or rm CMakeCache.txt
        popd
    end
    if test -f build/CMakeCache.txt
        cmake --build build
    end
end
