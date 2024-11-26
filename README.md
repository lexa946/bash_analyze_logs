# Скрипт чтения логов
Скрипт считывает логи, из файла __access.log__ и формирует краткий отчет в файл __report.txt__.

![Proccess Screen](source\img\main.png)

## Технологии
- bash
- awk

## Использование

Скачайте проект с GitHub
```sh
$ git clone https://github.com/lexa946/bash_analyze_logs.git
```

Перейдите в директорию
```sh
$ cd bash_analyze_logs
```

Добавьте модификатор запуска к скрипту
```sh
$ chmod +x analyze_logs.sh
```

Запустите скрипт
```sh
$ ./analyze_logs.sh
```

Отчет сохранится в файле __report.txt__. Проверить можно через cat
```sh
$ cat report.txt
```
