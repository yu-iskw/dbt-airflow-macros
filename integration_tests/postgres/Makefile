POSTGRES_IMAGE := postgres:17.5
POSTGRES_NAME := integration-tests-postgres

all: stop-postgres run-postgres run-tests stop-postgres

run-postgres:
	# docker pull $(POSTGRES_IMAGE)
	docker run --rm \
		--detach \
		--name $(POSTGRES_NAME) \
		-e POSTGRES_USER=postgres \
		-e POSTGRES_PASSWORD=postgres \
		-e POSTGRES_DB=testdb \
		-p 5432:5432 \
		$(POSTGRES_IMAGE)

stop-postgres:
	-docker stop $(POSTGRES_NAME)

clean-postgres:
	-docker rm -f $(POSTGRES_NAME)

run-tests:
	-bash -x run_tests.sh
