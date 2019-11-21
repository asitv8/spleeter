# =======================================================
# Library lifecycle management.
#
# @author Deezer Research <research@deezer.com>
# @licence MIT Licence
# =======================================================

FEEDSTOCK = spleeter-feedstock
FEEDSTOCK_REPOSITORY = https://github.com/deezer/$(FEEDSTOCK)
FEEDSTOCK_RECIPE = $(FEEDSTOCK)/recipe/spleeter/meta.yaml

all: clean build test deploy

clean:
	rm -Rf *.egg-info
	rm -Rf dist

build:
	python3 setup.py sdist

test:
	pytest -W ignore::FutureWarning -W ignore::DeprecationWarning -vv --forked

deploy:
	pip install twine
	twine upload --skip-existing dist/*