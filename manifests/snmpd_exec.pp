define snmp_rhel::snmpd_exec($job_name = $title, $command) {
  include snmp_rhel

  Exec {
    path => ["/usr/bin", "/usr/sbin", "/bin"],
  }

  $snmp_exec = "exec $job_name $command"

  # Append an exec statement into the snmpd.conf file, if it is not yet there
  exec { "echo $snmp_exec >> /etc/snmp/snmpd.conf":
    unless => "cat /etc/snmp/snmpd.conf | grep -e '^exec $job_name'",
    notify => Service['snmpd']
  }
}
