#!/bin/bash

# hostname_config.sh

generate_hostname_config() {
  local hostname="$1"
# d-i preseed/late_command string \\ - начало команды, которая будет выполнена после установки базовой системы.
# in-target \\ - указывает, что команды должны выполняться в установленной системе.
# echo "$hostname" > /target/etc/hostname; \\ - записывает имя сервера ($hostname) в файл /target/etc/hostname.
# sed -i "s/127.0.1.1.*/127.0.1.1 $hostname/g" /target/etc/hosts; \\ - заменяет строку 127.0.1.1 в файле /target/etc/hosts на 127.0.1.1 $hostname, где $hostname - имя сервера.
d-i preseed/late_command string \\
  in-target \\
    echo "$hostname" > /target/etc/hostname; \\
    sed -i "s/127.0.1.1.*/127.0.1.1 $hostname/g" /target/etc/hosts;
}


