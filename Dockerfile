FROM centos:6.6
MAINTAINER "linyows" <linyows@gmail.com>

RUN yum -q -y -x 'kernel*' -x 'centos*' --skip-broken update

RUN yum install -q -y wget perl mailcap libtool db4-devel expat-devel
RUN wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/apr-1.5.2-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/apr-devel-1.5.2-1.x86_64.rpm && \
  rpm -Uvh apr-1.5.2-1.x86_64.rpm apr-devel-1.5.2-1.x86_64.rpm && \
  rm -rf apr-1.5.2-1.x86_64.rpm apr-devel-1.5.2-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/apr-util-1.5.4-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/apr-util-devel-1.5.4-1.x86_64.rpm && \
  rpm -Uvh apr-util-1.5.4-1.x86_64.rpm apr-util-devel-1.5.4-1.x86_64.rpm && \
  rm -rf apr-util-1.5.4-1.x86_64.rpm apr-util-devel-1.5.4-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/httpd-2.4.16-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/httpd-devel-2.4.16-1.x86_64.rpm && \
  wget -q https://raw.githubusercontent.com/linyows/centos-6.6_rpms/master/mod_ssl-2.4.16-1.x86_64.rpm && \
  rpm -Uvh httpd-2.4.16-1.x86_64.rpm httpd-devel-2.4.16-1.x86_64.rpm mod_ssl-2.4.16-1.x86_64.rpm && \
  rm -rf httpd-2.4.16-1.x86_64.rpm httpd-devel-2.4.16-1.x86_64.rpm mod_ssl-2.4.16-1.x86_64.rpm
ADD httpd.conf /etc/httpd/conf/httpd.conf

RUN yum install -q -y epel-release
RUN yum install -q -y supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80 443
CMD ["/usr/bin/supervisord"]
