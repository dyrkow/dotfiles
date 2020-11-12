# Ansible 

```
brew install ansible
```

## Configuration

Файл конфигурации `./ansible.cfg`

В нем мы можем использовать дерективы
```
hostfile:./inventory - путь до инвентори файла
sudo_user: - пользователь, за которого на удаленных серверах все будет происходить
remote_port: — порт для подключения по протоколу SSH
```

## Inventory file

В этом  файле мы пишем все хосты или  ip серверов которые у нас есть.

Создаем файл `inventory`

```
macbook
```

Генерируем приватный и публичный ключ `ssh-keygen`, и загружаем его на нужный сервак по `ssh-copy-id`

## Paybooks

Плай буки храним вот тут `/etc/ansible/playbooks`

Создаем файл `dev_environment.yml`

в нем описываем 
```
- hosts: macbook
  tasks:

  - name: Install package nginx
    apt: name=nginx update_cache=yes
    sudo: yes
 
  - name: Starting service nginx
    service: name=nginx state=started
    sudo: yes
```

выполняем его `ansible-playbook dev_environment.yml`
