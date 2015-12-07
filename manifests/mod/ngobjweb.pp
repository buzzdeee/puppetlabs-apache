class apache::mod::ngobjweb(
  $options = {},
) {

  ::apache::mod { 'ngobjweb':
    loadfile_name => 'ngobjweb.load',
  }

  # Template uses:
  # - $options
  file { 'ngobjweb.conf':
    ensure  => file,
    path    => "${::apache::mod_dir}/ngobjweb.conf",
    content => template('apache/mod/ngobjweb.conf.erb'),
    require => Exec["mkdir ${::apache::mod_dir}"],
    before  => File[$::apache::mod_dir],
    notify  => Class['apache::service'],
  }
}
