find . -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
  filename="${file#./}"

  # Проверяем, есть ли точка в имени файла
  if [[ "$filename" == *.* ]]; then
    ext="${filename##*.}"
  else
    ext="no_extension"
  fi

  # Пропускаем файлы, которые уже в папке с расширением
  if [[ "$filename" == "$ext/"* ]]; then
    continue
  fi

  mkdir -p "$ext"
  echo "Перемещаем '$filename' в папку '$ext/'"
  mv -n -- "$filename" "$ext/"
done
