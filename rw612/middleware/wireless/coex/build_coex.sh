export NXP_RW612_SDK_ROOT='./third_party/mcu-sdk'
export ARMGCC_DIR='<path-to-armgcc>'

rm -rf build_rw612

# rdrw612bga
# build coex_wpa_supplicant, coex app (wifi + ble)
./script/build_rw612 coex_wpa_supplicant -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=rdrw612bga
# build coex_cli, coex app (wifi + ble)
#./script/build_rw612 coex_cli -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_APP_SUPP=OFF -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=rdrw612bga


# frdmrw612
# build coex_wpa_supplicant, coex app (wifi + ble)
#./script/build_rw612 coex_wpa_supplicant -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_APP_SUPP=ON -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=frdmrw612
# build coex_cli, coex app (wifi + ble)
#./script/build_rw612 coex_cli -DCOEX_ENABLE_WIFI=ON -DCOEX_ENABLE_BLE=ON -DCOEX_ENABLE_OT=OFF -DCOEX_APP_SUPP=OFF -DCOEX_NXP_BASE=edgefast -DCOEX_EXAMPLE_BOARD=frdmrw612
