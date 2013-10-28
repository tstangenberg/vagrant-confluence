define append_if_no_such_line($file, $line, $refreshonly = 'false') {
   exec { "/bin/echo '$line' >> '$file'":
      unless      => "/bin/grep -Fxqe '$line' '$file'",
      path        => "/bin",
      refreshonly => $refreshonly,
   }
}

class confluence {
  include java

  $confluence-archive = "http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.3.1.tar.gz"
  $confluence-app = "/vagrant/atlassian-confluence-5.3.1"
  $confluence-home = "/vagrant/confluence-home"
  $confluence-start = "$confluence-app/bin/start-confluence.sh"

  exec {
    "download_confluence":
    command => "curl -L $confluence-archive | tar zx",
    cwd => "/vagrant",
    user => "vagrant",
    path    => "/usr/bin/:/bin/",
    logoutput => true,
    timeout => 0,
    creates => "$confluence-app",
  }

 exec {
    "create_confluence_home":
    command => "mkdir -p $confluence-home",
    cwd => "/vagrant",
    user => "vagrant",
    path    => "/usr/bin/:/bin/",
    require => Exec["download_confluence"],
    logoutput => true,
    creates => "$confluence-home",    
  }

  append_if_no_such_line { 
    "configure-confluence-home":
    file => "$confluence-app/confluence/WEB-INF/classes/confluence-init.properties",
    line => "confluence.home=$confluence-home",
  }

  exec {
    "start_confluence_in_background":
    command => "$confluence-start &",
    cwd => "/vagrant",
    user => "vagrant",
    path    => "/usr/bin/:/bin/",
    require => [ Package["java"],
                 Exec["create_confluence_home"], 
                 append_if_no_such_line["configure-confluence-home"] ],
    logoutput => true,
  }

  append_if_no_such_line { motd:
    file => "/etc/motd",
    line => "Run confluence with: $confluence-start",
    require => Exec["start_confluence_in_background"],
  }

}

include confluence