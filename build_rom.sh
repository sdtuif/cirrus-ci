# sync rom
echo "=== Repo Initialization ==="
repo init --depth=1 --no-repo-verify -u https://github.com/Sa-Sajjad/android_manifest_nusa.git -b test-gif -g default,-mips,-darwin,-notdefault
echo "=== Clone DT VT & VT ==="
git clone https://github.com/Sa-Sajjad/manifest.git --depth 1 -b 1 .repo/local_manifests
echo "=== Repo Sync ==="
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
echo "=== Repo Sync Complete ==="

# build rom
echo "=== Run Build Cmd ==="
source build/envsetup.sh
lunch nad_lavender-userdebug
export TZ=Asia/Dhaka
make api-stubs-docs || echo no problem
make system-api-stubs-docs || echo no problem
make test-api-stubs-docs || echo no problem
mka nad

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
