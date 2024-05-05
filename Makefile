.PHONY: bootstrap
.PHONY: check/tools
.PHONY: setup/flutter

bootstrap:
	make check/tools
	make setup/flutter

# TODO: asdf がインストールされていない場合はインストールする
check/tools:
	./scripts/check_tools.sh

setup/flutter:
	asdf plugin add flutter
	asdf install flutter
