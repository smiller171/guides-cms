error_check:
	pylint -E `find ./pskb_website -iname '*.py' -o -path ./migrations -prune`

full_lint:
	pylint --disable=bad-continuation `find ./pskb_website -iname '*.py' -o -path ./migrations -prune`

clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete

deploy_stage:
	git push stage master

deploy_prod:
	git push prod production:master

push:
	git push origin master

stage_logs:
	heroku logs -t --app pskb-stage

prod_logs:
	heroku logs -t --app pskb-prod

prod_logs_app:
	heroku logs -t --app pskb-prod --source app

html_docs:
	cd docs; make html

test:
	py.test
