FROM samuelfooncg/rainbow_popcorns:BaseUbuntu20.04.3LTS_Blank

MAINTAINER samuel.foon.85@gmail.com

RUN apt-get update ; wget "https://sg-cloud.acronis.com/bc/api/ams/links/agents/redirect?language=multi&channel=CURRENT&system=linux&architecture=64&productType=enterprise&login=1254f486-359e-461f-bf21-d8e6995f2242&white_labeled=1" -O CyberProtect_AgentForLinux_x86_64.bin ; chmod +x CyberProtect_AgentForLinux_x86_64.bin ; uname -r ; cat /etc/lsb-release ; rm -r /lib/modules ; DEBIAN_FRONTEND=noninteractive apt install linux-modules-extra-$(uname -r) -y ; DEBIAN_FRONTEND=noninteractive apt-get install linux-generic -y
RUN DEBIAN_FRONTEND=noninteractive ./CyberProtect_AgentForLinux_x86_64.bin -a --skip-registration

RUN cp /opt/acronis/var/aakore/reg.yml /opt/acronis/var/aakore/reg.yml.bak
RUN cp /etc/Acronis/BackupAndRecovery.config /etc/Acronis/BackupAndRecovery.config.bak
RUN touch DateCreated_`date +%d%b%Y`
RUN rm CyberProtect_AgentForLinux_x86_64.bin 

#COPY ./sampleconfig/BackupAndRecovery.config /etc/Acronis/BackupAndRecovery.config
#COPY ./sampleconfig/reg.yml /opt/acronis/var/aakore/reg.yml

#RUN service supervisor restart
#RUN service supervisor start
#RUN supervisorctl reread
#RUN supervisor update

#CMD ["/usr/bin/supervisord"]
#ENTRYPOINT ["/usr/bin/supervisord"]
#ENTRYPOINT ["/bin/bash"]
