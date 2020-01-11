RELEASE=apache-archiva-bosh-release

help:
	@echo Please specify valid target: dev, rmdev, release final-release

dev:
	bosh create-release --force
	bosh upload-release
	bosh -n -d archiva deploy manifest.yml

rmdev:
	bosh -n -d archiva delete-deployment

release:
	bosh create-release --force --tarball $(PWD)/$(RELEASE).tgz
	sha1sum $(PWD)/$(RELEASE).tgz

final-release:
	last_tag=$(git describe --abbrev=0)
	if grep "version: ${last_tag}" releases/$(RELEASE)/index.yml > /dev/null
	then
		echo "Nothing to do."
	else
		bosh create-release --final --version=${last_tag}
	fi
