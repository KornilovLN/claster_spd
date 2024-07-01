import virtualbox
import json
import os

# Создаем экземпляр VirtualBox
vbox = virtualbox.VirtualBox()

# Функция для создания новой виртуальной машины
def create_vm(name, os_type, cpu, ram, vram, disk_size):
    try:
        # Создаем новую виртуальную машину
        session = vbox.create_session()
        machine = vbox.create_machine(settings_file=f"{name}.vbox", name=name, os_type=os_type, groups=["/"])

        # Настраиваем параметры виртуальной машины
        machine.set_cpu_count(cpu)
        machine.set_memory_size(ram)
        machine.set_vram_size(vram)

        # Создаем новый виртуальный жесткий диск
        progress = machine.create_hd(f"{name}.vdi", disk_size)
        progress.wait_for_completion()

        # Подключаем виртуальный жесткий диск к машине
        controller = machine.get_storage_controller_by_name("SATA Controller")
        machine.attach_device(controller.name, 0, 0, virtualbox.library.DeviceType.hard_disk, progress.data)

        return machine
    
    except Exception as e:
        print(f"Ошибка при создании виртуальной машины {name}: {e}")
    
        return None


# Функция для установки программного обеспечения после установки Debian
def install_software_after_debian(machine, software_list):
    try:
        session = vbox.create_session()
        session.machine = machine

        # Запускаем виртуальную машину
        progress = session.machine.launch_vm_process()
        progress.wait_for_completion()

        # Устанавливаем программное обеспечение
        for software in software_list:
            # Выполняем команды установки для каждого программного обеспечения
            session.console.guest.execute("sudo", ["apt-get", "update"])
            session.console.guest.execute("sudo", ["apt-get", "install", "-y", software])

        # Перезагружаем виртуальную машину
        session.console.power_down()
        progress = session.machine.launch_vm_process()
        progress.wait_for_completion()

    except Exception as e:
        print(f"Ошибка при установке программного обеспечения на {machine.name}: {e}")


def main():
    # Проверяем наличие файла topology.json
    if not os.path.exists("topology.json"):
        print("Файл topology.json не найден в текущей директории.")
        return

    try:
        # Загружаем данные из topology.json
        with open("topology.json", "r") as f:
            topology = json.load(f)
    except Exception as e:
        print(f"Ошибка при чтении файла topology.json: {e}")
        return

    # Итерируемся по серверам в topology.json
    for server in topology["claster"]:
        name = server["name"]
        os_type = "Debian_64" if server["target"]["os"] == "Debian" else None
        cpu = int(server["hard"]["cpu"])
        ram = int(server["hard"]["ram"]) * 1024  # Конвертируем ГБ в МБ
        vram = int(server["hard"]["vram"])
        disk_size = int(server["hard"]["rom"]) * 1024  # Конвертируем ГБ в МБ

        # Создаем виртуальную машину
        vm = create_vm(name, os_type, cpu, ram, vram, disk_size)
        if vm is None:
            continue  # Переходим к следующему серверу, если создание виртуальной машины не удалось

        # Подключаем к созданной машине ISO-образ Debian
        if not os.path.exists("./debian.iso"):
            print("iso образ debian не найден в текущей директории.")
            return
        else:
            vm.mount_dvd("./debian.iso")    

    # Устанавливаем программное обеспечение после установки Debian
    software_list = []
    if "docker" in server["assignment"]:
        software_list.append("docker.io")
    if "python3" in server["assignment"]:
        software_list.append("python3")
    install_software_after_debian(vm, software_list)

if __name__ == "__main__":
    main()
