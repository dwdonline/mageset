pause(){
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

echo "---> First, let's find the php.ini file we need to modify."
pause

sudo updatedb

phpini=$(locate fpm/php.ini)

read -e -p "---> Where is your php.ini file?: " -i "echo $phpini" PHP_FILE

sed -i "s,max_execution_time = 30,max_execution_time = 18000,g" PHP_FILE

sed -i "s,max_input_time = 60,max_input_time = 360,g" PHP_FILE

sed -i "s,zlib.output_compression = Off,zlib.output_compression = on,g" PHP_FILE

sed -i "s,upload_max_filesize = 2M,upload_max_filesize = 200M,g" PHP_FILE