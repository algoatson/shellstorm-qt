cmake_minimum_required(VERSION 3.16...3.21)

# These are part of the public API. Projects should use them to provide a
# consistent set of prefix-relative destinations.
if(NOT QT_DEPLOY_BIN_DIR)
    set(QT_DEPLOY_BIN_DIR "bin")
endif()
if(NOT QT_DEPLOY_LIB_DIR)
    set(QT_DEPLOY_LIB_DIR "lib64")
endif()
if(NOT QT_DEPLOY_PLUGINS_DIR)
    set(QT_DEPLOY_PLUGINS_DIR "plugins")
endif()
if(NOT QT_DEPLOY_QML_DIR)
    set(QT_DEPLOY_QML_DIR "qml")
endif()
if(NOT QT_DEPLOY_TRANSLATIONS_DIR)
    set(QT_DEPLOY_TRANSLATIONS_DIR "translations")
endif()
if(NOT QT_DEPLOY_PREFIX)
    set(QT_DEPLOY_PREFIX "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
endif()
if(QT_DEPLOY_PREFIX STREQUAL "")
    set(QT_DEPLOY_PREFIX .)
endif()
if(NOT QT_DEPLOY_IGNORED_LIB_DIRS)
    set(QT_DEPLOY_IGNORED_LIB_DIRS "/nix/store/a47ng79cyms30rhkin4h9r8d1pd3ngr5-gdb-14.1/lib;/nix/store/ilr7br1ck7i6wcgfkynwpnjp7n964h38-zlib-1.3.1/lib;/nix/store/kq8cmm07g2dzmxn3pa8x9328agps28d1-libxml2-2.12.4/lib;/nix/store/hylwzgm0sbkrsc0cr58sw8gzfb5s02wb-libxslt-1.1.39/lib;/nix/store/h24v1xs4i9l3k18ygxvs62361rl77804-openssl-3.0.13/lib;/nix/store/wjvic21zwfcrrdrb1sqmw4hviq893xql-sqlite-3.45.1/lib;/nix/store/3yap8aiic016mcn1wgvdgl1ck4wddk2d-unixODBC-2.3.12/lib;/nix/store/5scnbbbgz528bq7pxwh9fym6hjlkvq94-graphite2-1.3.14/lib;/nix/store/649pkpdac5530v3lhq5wh9gvz9ff698q-harfbuzz-7.3.0/lib;/nix/store/hqb16sf029wf4y6sxj3jwhnpkk8ank4k-icu4c-73.2/lib;/nix/store/m06f9ckrrgh3m8y7i6k8ciya6smy9ckp-libjpeg-turbo-3.0.2/lib;/nix/store/wmpmyzmnijgw6dy5vf2mlb4akqh3k6a2-libpng-apng-1.6.40/lib;/nix/store/4qrxl5iq0ncrypfazkbldccxlw71vl3z-pcre2-10.42/lib;/nix/store/ydq7i9bchp0xhbwv239vlrimbk4h9ja4-pcre-8.45/lib;/nix/store/071zgyb6945r8iwjbs31xyjanx0n5scb-libproxy-0.4.18/lib;/nix/store/ry1jx5972j5clvqapx33v9imba8ywvq6-zstd-1.5.5/lib;/nix/store/zwxbrjy2cl257b4w45vczrsfy3ys1vgf-double-conversion-3.3.0/lib;/nix/store/8llh1qc7r1vy7g3wmqpvd866yd062k4n-libb2-0.98.1/lib;/nix/store/447xb4rnd4zfc4dl1bmkhcdsf85hjc0v-md4c-0.5.2-lib/lib;/nix/store/yr1ijy4qw4kwf76j6gk8jkf37j1syb9a-expat-2.5.0/lib;/nix/store/xg3ld3c3xip8fx9agx901r1bz3fmnchv-dbus-1.14.10-lib/lib;/nix/store/zabxhfpsgkb9c4sb7fy50pn1l1kczzv2-libffi-3.4.4/lib;/nix/store/jdnaqlh1s0rhd0i8qsh9lprxqbw4b7xc-gettext-0.21.1/lib;/nix/store/hbdl12ck2ibhn5zsi8nsfa6v471pf0j6-glib-2.78.4/lib;/nix/store/xyglylv54jxw98dr2qpnm95hrws43qsc-sqlite-connector-odbc-0.9993/lib;/nix/store/m0nicpa4d724rljadlmw1m3qv0ja4syy-systemd-255.2/lib;/nix/store/ihiqsqc0z96c7f50yg3wqkwqwmdcksvd-util-linux-2.39.3-lib/lib;/nix/store/iyf4zzk8gn3hwaa9asi94zy46vqq3y38-mtdev-1.1.6/lib;/nix/store/3jfkx28pibz0a9hnf2dxk2wvk1aa1i7d-lksctp-tools-1.0.17/lib;/nix/store/b3l48hkyy6l1xrh0r6z3xnh7gmqc1skd-libselinux-3.3/lib;/nix/store/xsvdwbmxd1k3645dwlx6hpz7fqpg7bg3-libsepol-3.6/lib;/nix/store/s72qn2yv7n7n9ra4lfr89ipgksw6c3bb-liburcu-0.14.0/lib;/nix/store/nfmicz8b2sbwmlr45s1bpiz7slicq8zr-lttng-ust-2.13.7/lib;/nix/store/ji07cn67ysm5b2i1fxmd6crgs7iks6qa-vulkan-loader-1.3.275.0/lib;/nix/store/z4k4yz0w8bzawl9pi9qjxgmq0lj1dqhk-libthai-0.1.29/lib;/nix/store/nx2c1p91xnp726v7rqxx85snd0ljkzsd-libdrm-2.4.120/lib;/nix/store/x1m04ncch7pl5xsncyz7pbq9gfrxcxzv-libdatrie-2019-12-20-lib/lib;/nix/store/5a0l117cy3bv44l4gk2zqf18c9933sg9-systemd-minimal-libs-255.2/lib;/nix/store/m85lbihyh8ryq7pls2cijn9c4rk6m6cm-bzip2-1.0.8/lib;/nix/store/g8dkw32r6r47yc1dl3bsrscs88nrqzlh-brotli-1.1.0-lib/lib;/nix/store/4lkmcj5vk3z67n5fj5jby1x78rc29j7g-freetype-2.13.2/lib;/nix/store/nx1c1mdc0ccr63i8335b165iciyx4m71-fontconfig-2.15.0-lib/lib;/nix/store/3xk2qcmszdb3fapn7a0ys4nsxby65ir7-libxcb-1.16/lib;/nix/store/ga17mlfsss2fndyvp2s1m0s2rx2b4i9s-libX11-1.8.7/lib;/nix/store/4bhiy4xc6z97ib9acw8qgbgfgj7wxkcc-libXfixes-6.0.1/lib;/nix/store/cb2hrpm0wsydza0zdbhl4b3gkkmb3qml-libXcomposite-0.4.6/lib;/nix/store/xa6z5w0q7hg2yszmj992gzsbl6n35m4z-libXau-1.0.11/lib;/nix/store/d53qm45g7yban4xwhzsss55il56ba9w1-libXext-1.3.5/lib;/nix/store/2yalzi9hizxrb2hhf9aa21r8a303i3xn-libXi-1.8.1/lib;/nix/store/wyi1rdb4kd69myfhjdb9pxvzg3kilc01-libXrender-0.9.11/lib;/nix/store/bmgmkchjs0j3ip3kfp2rvjfm0b0qwwxg-libxkbcommon-1.5.0/lib;/nix/store/06x0gic9506rickplvqywly3vwd90l3a-xcb-util-0.4.1/lib;/nix/store/dvg3x7ib6jbv39i6d4qjq0smmzdbl1d2-xcb-util-image-0.4.1/lib;/nix/store/lzy5dhm9b82bvsfayw6x4xwdpijpimgx-xcb-util-keysyms-0.4.1/lib;/nix/store/k7gwn0jz46b1kkzn1xyis0z9906ccrxw-xcb-util-renderutil-0.3.10/lib;/nix/store/xs8nckql4v55cvvc3pb3d7jr8mj0b0f6-xcb-util-wm-0.4.2/lib;/nix/store/2xlv1347nhy4pwwfvsm9m7p5p11g4x2b-libXdmcp-1.1.4/lib;/nix/store/xcikbdgdq71rds89558mwzgpd786lavq-libXtst-1.2.4/lib;/nix/store/2haf48lrzqf8g680hwqishq7l4zc5x9v-xcb-util-cursor-0.1.4/lib;/nix/store/p74vc5hcxb0fjcc6av251d7pngfj7dgk-libepoxy-1.5.10/lib;/nix/store/9l8785vc3w2jbmcvjw4gkgrszrkg103z-libGL-1.7.0/lib;/nix/store/m3i46laviz11sywkad3xylq0ikwzfs29-libglvnd-1.7.0/lib;/nix/store/aqc0n6db6skgvyff227cqcxahddyfpw4-qt-full-6.6.2/lib;/nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib;/nix/store/qs1nwzbp2ml3cxzsxihn82hl0w73snr0-gcc-13.2.0/lib/gcc/x86_64-unknown-linux-gnu/13.2.0;/nix/store/1s98ricsglmfjjqkfnpvywnip5z7gp9q-gcc-13.2.0-lib/lib;/nix/store/4cjqvbp1jbkps185wl8qnbjpf8bdy8j9-gcc-wrapper-13.2.0/bin;/nix/store/qs1nwzbp2ml3cxzsxihn82hl0w73snr0-gcc-13.2.0/lib64;/nix/store/qs1nwzbp2ml3cxzsxihn82hl0w73snr0-gcc-13.2.0/lib")
endif()

# These are internal implementation details. They may be removed at any time.
set(__QT_DEPLOY_SYSTEM_NAME "Linux")
set(__QT_DEPLOY_IS_SHARED_LIBS_BUILD "ON")
set(__QT_DEPLOY_TOOL "GRD")
set(__QT_DEPLOY_IMPL_DIR "/home/notrazor/Documents/Qt/shellstorm-qt/src/.qt")
set(__QT_DEPLOY_VERBOSE "")
set(__QT_CMAKE_EXPORT_NAMESPACE "Qt6")
set(__QT_DEPLOY_GENERATOR_IS_MULTI_CONFIG "0")
set(__QT_DEPLOY_ACTIVE_CONFIG "")
set(__QT_NO_CREATE_VERSIONLESS_FUNCTIONS "")
set(__QT_DEFAULT_MAJOR_VERSION "6")
set(__QT_DEPLOY_QT_ADDITIONAL_PACKAGES_PREFIX_PATH "")
set(__QT_DEPLOY_QT_INSTALL_PREFIX "/nix/store/j7saqzfp9dg39hhxny74ivca1jd0kxv4-qtbase-6.6.2")
set(__QT_DEPLOY_QT_INSTALL_BINS "bin")
set(__QT_DEPLOY_QT_INSTALL_DATA ".")
set(__QT_DEPLOY_QT_INSTALL_LIBEXECS "./libexec")
set(__QT_DEPLOY_QT_INSTALL_PLUGINS "lib/qt-6/plugins")
set(__QT_DEPLOY_QT_INSTALL_TRANSLATIONS "/nix/store/zy1dzpspwbsl8cn4nj44qs6chk7x502f-qttranslations-6.6.2/translations")
set(__QT_DEPLOY_TARGET_QT_PATHS_PATH "/nix/store/j7saqzfp9dg39hhxny74ivca1jd0kxv4-qtbase-6.6.2/bin/qtpaths")
set(__QT_DEPLOY_PLUGINS "")
set(__QT_DEPLOY_MUST_ADJUST_PLUGINS_RPATH "ON")
set(__QT_DEPLOY_USE_PATCHELF "")
set(__QT_DEPLOY_PATCHELF_EXECUTABLE "")
set(__QT_DEPLOY_QT_IS_MULTI_CONFIG_BUILD_WITH_DEBUG "FALSE")
set(__QT_DEPLOY_QT_DEBUG_POSTFIX "")

# Define the CMake commands to be made available during deployment.
set(__qt_deploy_support_files
    "/nix/store/j7saqzfp9dg39hhxny74ivca1jd0kxv4-qtbase-6.6.2/lib/cmake/Qt6Core/Qt6CoreDeploySupport.cmake"
)
foreach(__qt_deploy_support_file IN LISTS __qt_deploy_support_files)
    include("${__qt_deploy_support_file}")
endforeach()

unset(__qt_deploy_support_file)
unset(__qt_deploy_support_files)