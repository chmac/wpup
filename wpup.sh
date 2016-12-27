#!/bin/bash

for wpdir in $(find /var/www/ -maxdepth 5 -type f -name 'wp-config.php' | sed 's/wp-config\.php//g')
do
	echo '===================='
	echo $wpdir
	echo '===================='
	echo "wp --path=$wpdir core upgrade"
	wp --path="$wpdir" core upgrade
	echo '===================='
	echo "wp --path=$wpdir plugin update --all"
	wp --path="$wpdir" plugin update --all
	echo '===================='
	echo "wp --path=$wpdir theme update --all"
	wp --path="$wpdir" theme update --all
	echo '===================='
done
