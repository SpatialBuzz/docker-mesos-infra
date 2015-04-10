class loadbalancer::install {

  docker::image { '192.168.1.119:5000/nginx':
    ensure => 'present'
  }

}