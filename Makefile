.PHONY: bootstrap
.PHONY: check/tools
.PHONY: setup/flutter
.PHONY: setup/melos

init:
	make check/tools
	make setup/flutter
	make setup/melos

# TODO: asdf がインストールされていない場合はインストールする
check/tools:
	./scripts/check_tools.sh

setup/flutter:
	asdf plugin add flutter
	asdf install flutter

setup/melos:
	dart pub global activate melos
	dart pub get
	melos bootstrap
