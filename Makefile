
help:
	@echo Please specify valid target: dev, rmdev

dev:
	bosh create-release --force
	bosh upload-release
	bosh -n -d archiva deploy manifest.yml

rmdev:
	bosh -n -d archiva delete-deployment
