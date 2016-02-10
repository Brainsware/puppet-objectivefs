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

To simply install objectivefs, you can:

```puppet
include objectivefs
```

However, this may not be very useful, as it will leave the environment entirely unconfigured.

```puppet
class { objectivefs:
  license           => 'license obtained from objectivefs.com',
  access_key_id     => 'access key id obtained from Google or AWS',
  secret_access_key => 'secret access key obtained from Google or AWS',
}
```

We highly recommend keeping these values *secret* using
[hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml), or
[hiera-vault](https://github.com/jsok/hiera-vault).

## Reference


## Limitations

This module has only been tested on Ubuntu so far.

## Development

Please see CONTRIBUTING.MD

