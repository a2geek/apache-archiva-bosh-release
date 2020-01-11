# Apache Archiva BOSH Release

This is a BOSH Release to deploy [Apache Archiva](http://archiva.apache.org/).

## Status

Works! Minor configuration capabilities, as most configuration seem to be in the user interface.

# Deployment

```
git clone https://github.com/a2geek/apache-archiva-bosh-release.git
cd apache-archiva-bosh-release
bosh -d archiva deploy manifest.yml
```

## Configuration options

| Operations File | Description |
| --- | --- |
| `operations/set-base-url.yml` | Used when Archiva is behind something like a HAProxy. If the URL or port does not match, Archiva assumes this is an attach and does not respond. |
| `operations/set-disk-size.yml` | Used to set a different disk size form the arbitratily chosen size of 10GiB. |

## Configuration variables

Structured variables will be similar to this:

```
archiva:
  disk_size: ...
  base_url: http(s)://...
```

# Development

For those used to `make` the delete/deploy sequences are just:

```
make rmdev dev
```

Otherwise, the usual mechanisms:

```
cd apache-archiva-bosh-release
bosh create-release --force
bosh upload-release
bosh -d archiva deploy manifest.yml -o operations/use-latest-dev.yml
```
