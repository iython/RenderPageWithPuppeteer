FROM centos:7

MAINTAINER iython <allinnnn@163.com>

RUN yum -y install epel-release && \
    yum -y --enablerepo="epel" update && \
    yum clean all && \
    yum -y --enablerepo="epel" install sudo vim git unzip wget && \
    yum -y --enablerepo="epel" install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc pango.x86_64 libXcomposite.x86_64 libXcursor.x86_64 libXdamage.x86_64 libXext.x86_64 libXi.x86_64 libXtst.x86_64 cups-libs.x86_64 libXScrnSaver.x86_64 libXrandr.x86_64 GConf2.x86_64 alsalib.x86_64 atk.x86_64 gtk3.x86_64 && \
    yum -y --enablerepo="epel" install alsa-lib-devel && \ 
    yum -y --enablerepo="epel" install python36-devel && \
    yum -y --enablerepo="epel" install python36-setuptools && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.6
#========================================
# Add normal user(xyz) with passwordless sudo
#========================================
RUN useradd xyz && \
    echo 'xyz  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
    # chmod -R 777 /home/xyz
#==============================
# Timezone && Locale
#==============================
ENV TZ Asia/Shanghai
ENV LANG zh_CN.UTF-8

COPY . /home/xyz/puppeteer/
WORKDIR /home/xyz/puppeteer
RUN git clone https://github.com/scheib/chromium-latest-linux
RUN /home/xyz/puppeteer/chromium-latest-linux/update.sh
RUN pip3 install -r /home/xyz/puppeteer/requirements.txt -i https://pypi.doubanio.com/simple
