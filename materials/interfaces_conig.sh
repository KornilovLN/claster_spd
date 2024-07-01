#!/bin/bash

# interfaces_config.sh

generate_interfaces_config() {
  # Код для генерации блока инструкций для настройки /etc/network/interfaces
    d-i preseed/late_command string \\
        in-target \\
        echo "127.0.0.1 localhost" > /target/etc/network/interfaces; \\
        echo "#--------------------------------------------------------------" >> /target/etc/network/interfaces; \\
        echo "# This file describes the network interfaces available on your system" >> /target/etc/network/interfaces; \\
        echo "# and how to activate them. For more information, see interfaces(5)." >> /target/etc/network/interfaces; \\

        echo "source /etc/network/interfaces.d/*" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "# The loopback network interface" >> /target/etc/network/interfaces; \\
        echo "auto lo" >> /target/etc/network/interfaces; \\

        echo "iface lo inet loopback" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "auto enp2s0f0" >> /target/etc/network/interfaces; \\

        echo "iface enp2s0f0 inet static" >> /target/etc/network/interfaces; \\

        echo "    network 192.168.201.0" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "auto enp2s0f0:1" >> /target/etc/network/interfaces; \\
        echo "iface enp2s0f0:1 inet static" >> /target/etc/network/interfaces; \\

        echo "    network 192.168.1.0" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "#allow-hotplug enp2s0f1" >> /target/etc/network/interfaces; \\

        echo "auto enp2s0f1" >> /target/etc/network/interfaces; \\
        echo "iface enp2s0f1 inet static" >> /target/etc/network/interfaces; \\

        echo "    network 192.168.202.0" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "auto enp2s0f1:1" >> /target/etc/network/interfaces; \\
        echo "iface enp2s0f1:1 inet static" >> /target/etc/network/interfaces; \\
        echo "    network 172.22.20.0" >> /target/etc/network/interfaces; \\
        echo "    up route add -net 10.101.64.0/24 gw 172.22.20.169 dev enp2s0f1:1" >> /target/etc/network/interfaces; \\
        echo "    up route add -net 172.23.0.0/16 gw 172.22.20.169 dev enp2s0f1:1" >> /target/etc/network/interfaces; \\
        echo "    up route add -net 172.24.0.0/16 gw 172.22.20.169 dev enp2s0f1:1" >> /target/etc/network/interfaces; \\
        echo "    up route add -net 172.25.0.0/16 gw 172.22.20.169 dev enp2s0f1:1" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "auto enp2s0f1:2" >> /target/etc/network/interfaces; \\
        echo "iface enp2s0f1:2 inet static" >> /target/etc/network/interfaces; \\
        echo "    network 192.168.2.0" >> /target/etc/network/interfaces; \\
        echo "" >> /target/etc/network/interfaces; \\

        echo "auto enp3s0f1" >> /target/etc/network/interfaces; \\
        echo "iface enp3s0f1 inet static" >> /target/etc/network/interfaces; \\
        echo "    network 10.0.0.0" >> /target/etc/network/interfaces; \\
        echo "    netmask 255.255.255.0" >> /target/etc/network/interfaces; \\
        echo "    broadcast 10.0.0.255" >> /target/etc/network/interfaces;

}