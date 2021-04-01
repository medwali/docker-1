FROM ubuntu:18.04

RUN apt-get update && \
	apt-get install -y curl openssh-server ca-certificates tzdata && \
	curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash && \
	apt-get install gitlab-ce

RUN mkdir /etc/gitlab/ssl
RUN openssl req -x509 -nodes -subj "/" -days 365 -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlabkey.key -out /etc/gitlab/ssl/gitlabcert.crt

RUN mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.bak
RUN	echo "external_url 'https://0.0.0.0'" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlabcert.crt\"" >> /etc/gitlab/gitlab.rb && \
	echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlabkey.key\"" >> /etc/gitlab/gitlab.rb && \
	echo "letsencrypt['enable'] = false" >> /etc/gitlab/gitlab.rb

EXPOSE 443 80 22

RUN echo "/opt/gitlab/embedded/bin/runsvdir-start & true" >> /entrypoint.sh && \
	echo "[ ! -e /opt/.is_configured ] && gitlab-ctl reconfigure && touch /opt/.is_configured" >> /entrypoint.sh && \
	echo "/etc/init.d/ssh start" >> /entrypoint.sh && \
	echo "gitlab-ctl start" >> /entrypoint.sh && \
	echo "wait" >> /entrypoint.sh

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
