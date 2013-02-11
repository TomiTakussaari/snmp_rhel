class snmp_rhel {
  package { "net-snmp":
    ensure => installed
  }

  service { "snmpd":
    ensure    => running,
    hasstatus => true
  }
}
