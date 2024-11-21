# linux cli bash script

# найти все файлы в текущtй директории Каждый из файлов переименовать по правилу:

# 1. оставить расширения файлов .mp4 .png .jpg
# 2. имя файла - это результат работы команды sha256


# Перебираем все файлы в текущей директории
for file in *; do
    # Проверяем, является ли элемент файлом
    if [[ -f "$file" ]]; then
        # Получаем расширение файла
        extension="${file#*.}"
        
        # Вычисляем SHA256 хэш имени файла
        hash=$(sha256sum "$file" | awk '{ print $1 }')
        
        # Формируем новое имя файла с сохранением расширения
        new_name="${hash}.${extension}"
        
        # Переименовываем файл
        mv "$file" "$new_name"
    fi
done

# ----------------------------------

# сделай bash скрипт, который перемещаяет все файлы из текущей директории в новые поддиректории по правилу

# 1. из имени файла берётся первые две буквы
# 2. файл перемещается в подпапку, имя подпапки - это две буквы из пункта 1
# 3. если папки нет, то она создаётся

# Перебираем все файлы в текущей директории
for file in *; do
    # Проверяем, является ли элемент файлом
    if [[ -f "$file" ]]; then
        # Получаем первые две буквы имени файла
        prefix="${file:0:2}"
        
        # Создаем поддиректорию, если она не существует
        mkdir -p "$prefix"
        
        # Перемещаем файл в соответствующую поддиректорию
        mv "$file" "$prefix/"
    fi
done