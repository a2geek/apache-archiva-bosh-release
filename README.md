# Apache Archiva BOSH Release

This is a BOSH Release to deploy [Apache Archiva](http://archiva.apache.org/).

## Status

Must deploy _development_ version at this time:

```
git clone https://github.com/a2geek/apache-archiva-bosh-release.git
cd apache-archiva-bosh-release
bosh create-release --force
bosh upload-release
bosh -d archiva deploy manifest.yml
```

For those used to `make` the delete/deploy sequences are just:

```
make rmdev dev
```
