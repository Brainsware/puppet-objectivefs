# == Class objectivefs::params
#
# This class is meant to be called from objectivefs.
# It sets variables according to platform.
#
class objectivefs::params {

  $download_path = '/var/cache/objectivefs'
  $package_name  = 'objectivefs'
  $base_url      = 'https://objectivefs.com/user/download'

  unless $::architecture == 'amd64' {
    fail("${::architecture} not supported")
  }

  case $::osfamily {
    'Debian': {
      $package_provider = 'dpkg'
      $dependencies     = [ 'fuse' ]
      $package_prefix   = "${package_name}_"
      $package_suffix   = '_amd64.deb'
    }
    'RedHat', 'Amazon': {
      $package_provider = 'rpm'
      $dependencies     = [ 'fuse' ]
      $package_prefix   = "${package_name}-"
      $package_suffix   = '-1.x86_64.rpm'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
