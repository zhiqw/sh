# !bin/bash

if [ $# -eq 0 ]; then
    VERSION="1.10.20"
else
    VERSION=$1
fi

# install composer
if [ ! -f "/usr/bin/composer" ] || [ ! -f "/usr/local/bin/composer" ]; then
    wget https://getcomposer.org/download/$VERSION/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer
# mac
# wget https://getcomposer.org/download/$VERSION/composer.phar -O  /usr/local/bin/composer && chmod u+x /usr/local/bin/composer
fi


# set aliyun packagist url
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

