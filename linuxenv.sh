if [ "$build" = "flash" ]; then
	echo "flash"
	alias b="rm bin/flash/bin/MintFlx.swf; openfl build flash -debug -Dlegacy"
	alias r="google-chrome bin/flash/bin/test.html"
	alias bb="rm bin/flash/bin/MintFlx.swf; openfl build flash -debug -Dlegacy; google-chrome bin/flash/bin/test.html"
elif [ "$build" = "cpp" ]; then
	echo "cpp"
	alias b="rm bin/linux64/cpp/bin/MintFlx; openfl build linux -debug -Dlegacy"
	alias r="(cd bin/linux64/cpp/bin; ./MintFlx)"
	alias bb="rm bin/linux64/cpp/bin/MintFlx; openfl build linux -debug -Dlegacy; (cd bin/linux64/cpp/bin; ./MintFlx)"
elif [ "$build" = "html5" ]; then
	echo "html5"
	alias b="rm bin/html5/bin/index.html; openfl build html5 -debug -Dlegacy"
	alias r="(google-chrome-beta bin/html5/bin/index.html)"
	alias bb="rm bin/html5/bin/index.html; openfl build html5 -debug -Dlegacy; google-chrome-beta bin/html5/bin/index.html"
else
	echo "No build"
fi
