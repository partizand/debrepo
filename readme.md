Личный репозиторий
==================

Добавление публичного ключа
---------------------------

```
wget https://github.com/partizand/debrepo/raw/master/partizandpub.asc.gpg
sudo mv ./partizandpub.asc.gpg /etc/apt/trusted.gpg.d/
```

Добавление в источники
----------------------

```
sudo echo "deb http://partizand.github.io/debrepo/ buster main" /etc/apt/sources.list.d/partizand.list
sudo apt update
```

[Список пакетов buster](buster-list.txt)

Операции с пакетами
-------------------

Добавление deb пакета

```
reprepro includedeb buster путь_к_пакету.deb
```

Добавление source пакета

```
reprepro includedeb buster путь_к_файлу.changes
```

Удаление пакета

```
reprepro remove buster имя_пакета
```

Пересоздание репозитория
------------------------

Начальная инициализация репозитория:

```
cd ~/prog/debrepo
reprepro export
reprepro createsymlinks
```
 
