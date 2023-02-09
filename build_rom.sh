# sync rom
echo "=== Repo Initialization ==="
repo init --depth=1 --no-repo-verify -u https://github.com/Sa-Sajjad/android_manifest_nusa.git -b backup -g default,-mips,-darwin,-notdefault
echo "=== Clone DT VT & VT ==="
git clone https://github.com/Sa-Sajjad/manifest.git --depth 1 -b eas .repo/local_manifests
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
