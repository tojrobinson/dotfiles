#!/usr/bin/env bash

CONFIG_DIR=$(pwd)
CONFIG_FILES=""
PREFIX="."
SAVE="REPLACED_CONFIG_DIR_$$"

while getopts "d:p:s:f:h" o
do 
   case "$o" in
      d) CONFIG_DIR="$OPTARG";;
      p) PREFIX="$OPTARG";;
      s) SAVE="${OPTARG}/${SAVE}";;
      f) CONFIG_FILES="$OPTARG";;
      h|help) echo -e "-d    Directory where the configuration files are; defaults to current directory.\n"
              echo -e "-p    Prefix for the files to use during setup; defaults to . files. Use '' for no prefix.\n"
              echo -e "-s    Directory in which to save the current system's configuration files; defaults to $HOME/REPLACED_CONFIG_DIR\n"
              echo -e "-f    Manually specify configuration files to install. Argument is a : delimited string of filenames, e.g., -f '.vimrc:.bashrc'. Can be used in conjunction with the -d option.\n"
              echo -e "-h    Show help menu\n"
              exit 1;;
   [?]) echo "incorrect switch specified or no argument given. valid options: [dpsfh]"
        exit 1;;
   esac
done

# default to home
[ -n "${SAVE/*\/*/}" ] && SAVE="${HOME}/${SAVE}"
mkdir -p "$SAVE"

echo $SAVE >> saveDirs
echo "saving system files to $SAVE"

if [ -z "$CONFIG_FILES" ]
then
   while IFS= read -d $'\0' -r FILE
   do
      echo "installing: $FILE"
      BASE_NAME=$(basename "$FILE")
      [ -e "${HOME}/${BASE_NAME}" ] && mv "${HOME}/${BASE_NAME}" "$SAVE"
      ln -s "$FILE" "${HOME}/${BASE_NAME}"
   done < <(find "$CONFIG_DIR" -iname "$PREFIX*" -print0)
else
   IFS=":"
   for FILE in $CONFIG_FILES
   do
      FILE_PATH="${CONFIG_DIR}/${FILE}"
      if [ -e "$FILE_PATH" ] 
      then
         echo "installing: $FILE"
         [ -e "${HOME}/${FILE}" ] && mv "${HOME}/${FILE}" "$SAVE"
         ln -s "${FILE_PATH}" "${HOME}/${FILE}"
      fi
   done
fi

echo "done"
bash
