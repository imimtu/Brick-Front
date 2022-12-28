echo "🟦\033[34m Brick-Front Prebuild Start \033[0m"
echo

echo "🟨\033[33m Remove pubspec.lock \033[0m"
rm -f pubspec.lock
echo

echo "🟨\033[33m Pub Get \033[0m"
flutter pub get
echo

echo "🟨\033[33m Move to ios directory \033[0m"
cd ios
echo

if [ -f "Podfile" ]
then
    echo "🟨\033[33m Pod Install \033[0m"
    pod install
else
    echo "🟨\033[33m Podfile Not Exist \033[0m"
fi
echo

echo "🟨\033[33m Move to Brick-Front directory \033[0m"
cd ..
echo

echo "🟦\033[34m Brick-Front Prebuild Finish \033[0m"