define nginx::resource::default (
  $ensure = 'present',
  $proxypass = 'no',
  $proxypasstarget = ''
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/nginx/conf.d/default.conf":
    ensure   => $ensure ? {
      'absent' => absent,
      default  => 'file',
    },
    content  => template('nginx/conf.d/default.conf.erb'),
    notify   => Class['nginx::service'],
  }
}