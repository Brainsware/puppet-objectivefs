#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with objectivefs](#setup)
    * [What objectivefs affects](#what-objectivefs-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

[ObjectiveFS](https://objectivefs.com/) is a "The reliable shared file system",
and this module aims to make it *actually* easy to use ;)

## Module Description

[ObjectiveFS](https://objectivefs.com/why) is a shared distributed POSIX file
system that provides persistent data storage among your cloud instances,
laptops, containers and office servers.

This module helps install objectivefs binary, and set-up the mount-points.

This module will *not* help you obtain your S3 or Google Storage API keys.

## Setup

### What objectivefs affects

* downloads and installs objectivefs package
* configures the objectivefs environment
* customizes configuration for mountpoints

### Setup Requirements

This module will require [puppet-archive](https://forge.puppetlabs.com/puppet/archive)


## Usage

To simply install objectivefs, you have to at least give it your user id:

```puppet
class { objectivefs:
  uid => 'a7m3fig6c6',
}
```

However, that will only install the software, leaving it otherwise
unconfigured, and, useless. Once you provide your license, you can actually
start using it:

```puppet
class { objectivefs:
  uid               => 'a7m3fig6c6',
  license           => 'license obtained from objectivefs.com',
  access_key_id     => 'access key id obtained from Google or AWS',
  secret_access_key => 'secret access key obtained from Google or AWS',
}
```

We highly recommend keeping these values *secret* using
[hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml), or
[hiera-vault](https://github.com/jsok/hiera-vault).

## Reference

### objectivefs

This is the main class that drives the installation and the main configuration

#### uid

The ObjectiveFS provided UID. This can be obtained from the package
[download URLs](https://objectivefs.com/user/downloads).

* String[9, 9]
* This parameter has no default

#### package_provider

The package provider

* String
* `rpm` on RedHat derivatives, `dpkg` on Debians.


#### dependencies

External dependencies this package needs. Since we're installing through a
low-level package provider, dependencies might not be resolved automatically.
Here we provide an option to install them.

* Array[String]
* `[ 'fuse' ]`

#### download_path

Where to store the package archive on disk. This directory will be created if
it doesn't exist.

* Unixpath
* `/var/cache/objectivefs`

#### version

Version to install. This must be a valid objectivefs version. Strings like
`latest` will **not** work.

* String
* 4.1.1

#### download_url

This is the URL where we download the package. There's generally no reason to
change this, unless you're mirroring your own packages.

* HTTPSUrl
* `"${_base_url}/${uid}/${_package_prefix}/${version}/${_package_suffix}"`


## Limitations

This module has only been tested on Ubuntu so far.

## Development

Please see CONTRIBUTING.MD

