FROM linyows/centos:6.4
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update
RUN yum -y install openssh-server sudo hostname unzip bzip2 tar wget cronie diffutils
RUN rpm -Uvh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.3.0-1.el6.x86_64.rpm
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm && yum -y install puppet-3.7.5
