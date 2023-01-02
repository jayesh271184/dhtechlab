cp /etc/ssh/sshd_config /etc/ssh/sshd-${1}_config
sed -i 's/#Port 22/Port '${1}'/g' /etc/ssh/sshd-${1}_config
cp /usr/lib/systemd/system/sshd.service /usr/lib/systemd/system/sshd-${1}.service
sed -i 's/ExecStart=\/usr\/sbin\/sshd -D $OPTIONS/ExecStart=\/usr\/sbin\/sshd -D -f \/etc\/ssh\/sshd-'${1}'_config $OPTIONS/g' /usr/lib/systemd/system/sshd-${1}.service

sleep 3

systemctl daemon-reload
systemctl enable sshd-${1}.service --now
systemctl status sshd-${1}.service
