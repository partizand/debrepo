Личный репозиторий
==================

Добавление в источники
----------------------

```
sudo echo "deb [trusted=yes] http://partizand.github.io/debrepo/ buster main" /etc/apt/sources.list.d/andrey.list
sudo apt update
```

[Список пакетов](packagelist.txt)

Операции с пакетами
-------------------

Добавление пакета

```
reprepro -C main includedeb andrey путь_к_пакету.deb
```

Удаление пакета

```
reprepro -C main remove main имя_пакета
```

Клонирование
------------

```
cd ~/prog
git clone git@github.com:partizand/debrepo.git
cd debrepo
```

Пересоздание репозитория
------------------------

Начальная инициализация репозитория:

```
cd ~/prog/debrepo
reprepro export
reprepro createsymlinks
```
 
