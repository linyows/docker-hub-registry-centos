FROM linyows/centos:7.1_chef-12.3_puppet-3.7
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update
RUN yum -y install curl gzip git
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2 && rvm use 2.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
