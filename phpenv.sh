phpenv_root="/opt/phpenv"
export PHPENV_ROOT="$phpenv_root"
export PATH="${phpenv_root}/bin:$PATH"
eval "$(phpenv init -)"
