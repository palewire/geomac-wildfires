.PHONY: test ship

test:
	pipenv run coverage run test.py
	pipenv run coverage report -m


ship:
	rm -rf build/
	rm -rf dist/
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/* --skip-existing

lint:
	pipenv run flake8 ./