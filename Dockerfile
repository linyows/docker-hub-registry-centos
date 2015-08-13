FROM linyows/centos:6.6_apache-2.4_phpenv
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update

RUN yum install -q -y mysql tar bzip2 libmcrypt-devel \
  bzip2-devel libc-client-devel curl-devel freetype-devel gmp-devel \
  libjpeg-devel libpng-devel libXpm-devel krb5-devel openssl-devel t1lib-devel libmcrypt-devel \
  mhash-devel readline-devel libxml2-devel libtidy-devel libxslt-devel pcre-devel sqlite-devel \
  mysql-libs postgresql-libs re2c

ADD default_configure_options /opt/phpenv/plugins/php-build/share/php-build/default_configure_options
RUN /bin/bash -l -c "phpenv install 5.5.25"
RUN /bin/bash -l -c "phpenv global 5.5.25"
RUN ln -s /opt/phpenv/versions/5.5.25/etc /etc/php5
