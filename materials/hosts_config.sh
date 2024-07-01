#!/bin/bash

# hosts_config..sh

generate_hosts_config() {
  # Код для генерации блока инструкций для настройки /etc/hosts
# d-i preseed/late_command string \\ - начало команды, которая будет выполнена после установки базовой системы.
# in-target \\ - указывает, что команды должны выполняться в установленной системе.
# echo "127.0.0.1 localhost" >> /target/etc/hosts; \\ - добавляет строку 127.0.0.1 localhost в файл /target/etc/hosts.
# echo "#--------------------------------------------------------------" >> /target/etc/hosts; \\ - добавляет комментарий в файл /target/etc/hosts.
# echo "192.168.201.221 srs21.1" >> /target/etc/hosts; \\ - добавляет строку 192.168.201.221 srs21.1 в файл /target/etc/hosts.
# Аналогично добавляются остальные строки из предоставленных настроек.
  d-i preseed/late_command string \\
    in-target \\
      echo "127.0.0.1 localhost" >> /target/etc/hosts; \\
      echo "#--------------------------------------------" >> /target/etc/hosts; \\
      echo "192.168.201.221 srs21.1" >> /target/etc/hosts; \\
      echo "192.168.201.222 srs22.1" >> /target/etc/hosts; \\
      echo "192.168.202.221 srs21.2" >> /target/etc/hosts; \\
      echo "192.168.202.222 srs22.2" >> /target/etc/hosts; \\
      echo "172.22.20.81 srs11" >> /target/etc/hosts; \\
      echo "172.22.20.82 srs12" >> /target/etc/hosts; \\
      echo "172.22.20.83 srs21" >> /target/etc/hosts; \\
      echo "172.22.20.84 srs22" >> /target/etc/hosts; \\
      echo "172.22.20.11 ntp1" >> /target/etc/hosts; \\
      echo "172.22.20.22 ntp2" >> /target/etc/hosts; \\
      echo "172.22.20.31 ntp3" >> /target/etc/hosts; \\
      echo "172.22.20.42 ntp4" >> /target/etc/hosts; \\
      echo "#--------------------------------------------" >> /target/etc/hosts; \\
        echo "172.22.20.180 TSCadmin" >> /target/etc/hosts; \\
        echo "172.22.20.250 srv3" >> /target/etc/hosts; \\
        echo "172.22.20.1 GES01" >> /target/etc/hosts; \\
        echo "172.22.20.2 GES02" >> /target/etc/hosts; \\
        echo "172.22.20.11 GES41_1" >> /target/etc/hosts; \\
        echo "172.22.20.12 GES42_2" >> /target/etc/hosts; \\
        echo "172.22.20.21 GES41_2" >> /target/etc/hosts; \\
        echo "172.22.20.22 GES42_2" >> /target/etc/hosts; \\
        echo "172.22.20.31 GES41_3" >> /target/etc/hosts; \\
        echo "172.22.20.32 GES42_3" >> /target/etc/hosts; \\
        echo "172.22.20.41 GES41_4" >> /target/etc/hosts; \\
        echo "172.22.20.42 GES42_4" >> /target/etc/hosts; \\
        echo "172.22.20.51 GES01_5" >> /target/etc/hosts; \\
        echo "172.22.20.52 GES02_5" >> /target/etc/hosts; \\
        echo "172.22.20.61 GES01_6" >> /target/etc/hosts; \\
        echo "172.22.20.62 GES02_6" >> /target/etc/hosts; \\
        echo "#----------------------------------------------" >> /target/etc/hosts; \\
        echo "10.101.64.5 srv-dcc-01 cc01" >> /target/etc/hosts; \\
        echo "10.101.64.6 srv-dcc-02 cc02" >> /target/etc/hosts; \\
        echo "10.101.64.8 srv-dcc-03 cc03" >> /target/etc/hosts; \\
        echo "#----------------------------------------------" >> /target/etc/hosts; \\
        echo "1 localhost ip6-localhost ip6-loopback" >> /target/etc/hosts; \\
        echo "ff02:1 ip6-allnodes" >> /target/etc/hosts; \\
        echo "ff02::2 ip6-allrouters" >> /target/etc/hosts; \\
        echo "#----------------------------------------------" >> /target/etc/hosts; \\
        echo "10.101.64.6 sdn.dc.cns.atom registry.dc.cns.atom redmine.dc.cns.atom" >> /target/etc/hosts; \\
        echo "127.0.0.1 registry.znpp.cns.atom" >> /target/etc/hosts;
}