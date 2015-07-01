FROM linyows/centos:6.4_chef-12.3_puppet-3.7
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update
RUN yum -y install curl gzip git
RUN curl -L get.rvm.io | bash -s stable && /usr/local/rvm/bin/rvm requirements
