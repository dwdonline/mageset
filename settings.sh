pause(){
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

echo "---> First, let's find the php.ini file we need to modify."
pause

sudo updatedb

phpini=$(locate fpm/php.ini)

read -e -p "---> Where is your php.ini file?: " -i "$phpini" PHP_FILE

echo "---> Now, let's change the settings."
pause

sed -i "s,max_execution_time = 30,max_execution_time = 18000,g" ${PHP_FILE}

sed -i "s,max_input_time = 60,max_input_time = 360,g" ${PHP_FILE}

sed -i "s,; max_input_vars = 1000,max_input_vars = 10000,g" ${PHP_FILE}

sed -i "s,memory_limit = 128M,memory_limit = 1024M,g" ${PHP_FILE}

sed -i "s,zlib.output_compression = Off,zlib.output_compression = on,g" ${PHP_FILE}

sed -i "s,upload_max_filesize = 2M,upload_max_filesize = 200M,g" ${PHP_FILE}

echo "All done!"
