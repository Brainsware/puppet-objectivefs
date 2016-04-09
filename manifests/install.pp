# == Class objectivefs::install
#
# This class is called from objectivefs for install.
#
class objectivefs::install {

  package { $::objectivefs::dependencies:
    ensure => present,
    before => Package[$::objectivefs::package_name],
  }

  file { $::download_path:
    ensure => directory,
  } ->
  archive { "${::download_path}/${::objectivefs::package_file}":
    ensure  => present,
    extract => false,
    source  => $::objectivefs::download_url,
    cleanup => false,
  } ~>
  package { $::objectivefs::package_name:
    ensure   => present,
    provider => $::objectivefs::package_provider,
    source   => "${::download_path}/${::objectivefs::package_file}",
  }
}