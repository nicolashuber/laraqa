#!/bin/sh

COMPOSER_BIN=/root/.composer/vendor/bin/

phpcs() {
    echo "\nRunning PHP CodeSniffer...\n"
    exec $COMPOSER_BIN/phpcs --standard=PSR1,PSR2,PSR12 --ignore="*/vendor/,tests/,database/,bootstrap/,public/,storage/" --colors /app
}

phpmd() {
    echo "\nRunning PHP MD...\n"
    exec $COMPOSER_BIN/phpmd app text /phpqa/phpmd.rulesets.xml --color
}

phpstan() {
    echo "\nRunning PHP Larastan...\n"
    exec $COMPOSER_BIN/phpstan analyse -c /phpqa/phpstan.neon --memory-limit=2G app
}

if [ "$1" = "phpcs" ]; then
    phpcs
elif [ "$1" = "phpmd" ]; then
    phpmd
elif [ "$1" = "phpstan" ]; then
    phpstan
elif [ "$1" = "bash" ]; then
    bash
fi
