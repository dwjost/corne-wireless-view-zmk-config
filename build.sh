#!/usr/bin/env sh
#!/usr/bin/env sh
set -x

build_left_script="set -x;\
    west build --pristine=always -s zmk/app -d './build' -b 'nice_nano_v2' -S 'studio-rpc-usb-uart' -- -DZMK_CONFIG=/workdir/config -DSHIELD='corne_left nice_view_adapter nice_view'
    "
build_right_script="set -x;\
    west build --pristine=always -s zmk/app -d './build' -b 'nice_nano_v2' -S 'studio-rpc-usb-uart' -- -DZMK_CONFIG=/workdir/config -DSHIELD='corne_right nice_view_adapter nice_view'
    "
# Make it happen...
eval "${build_left_script}"
cp ${work_dir}/build/zephyr/zmk.uf2 ../zmk_left.uf2
eval "${build_right_script}"
cp ${work_dir}/build/zephyr/zmk.uf2 ../zmk_right.uf2
