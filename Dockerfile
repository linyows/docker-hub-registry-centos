FROM linyows/centos:6.6_apache-2.4
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update
RUN yum install -q -y curl git

ENV PHPENV_ROOT /opt/phpenv
RUN curl https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | bash && \
  mkdir /opt/phpenv/plugins && cd /opt/phpenv/plugins && \
  git clone https://github.com/CHH/php-build.git
ADD phpenv.sh /etc/profile.d/phpenv.sh
