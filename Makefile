setup:
	bash ./dev/setup.sh

lint: lint-yaml lint-bash

lint-yaml:
	bash ./ci/lint_yaml.sh

lint-bash:
	bash ./ci/lint_bash.sh