# == Class objectivefs::config
#
# This class is called from objectivefs for service config.
#
class objectivefs::config {

  $envdir = '/etc/objectivefs.env'

  file { $envdir:
    ensure => directory,
  }

  file { "${envdir}/OBJECTIVEFS_LICENSE":
    ensure  => file,
    mode    => '0400',
    content => $::objectivefs::license,
    require => File[$envdir],
  }
  file { "${envdir}/OBJECTIVEFS_LICENSE":
    ensure  => file,
    mode    => '0400',
    content => $::objectivefs::license,
    require => File[$envdir],
  }

  file { "${envdir}/AWS_ACCESS_KEY_ID":
    ensure  => file,
    mode    => '0400',
    content => $::objectivefs::access_key_id,
    require => File[$envdir],
  }
  file { "${envdir}/AWS_SECRET_ACCESS_KEY":
    ensure  => file,
    mode    => '0400',
    content => $::objectivefs::secret_access_key,
    require => File[$envdir],
  }

  file { "${envdir}/AWS_DEFAULT_REGION":
    ensure  => file,
    mode    => '0400',
    content => $::objectivefs::default_region,
    require => File[$envdir],
  }
}
