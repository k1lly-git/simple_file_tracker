# simple_file_tracker

## [Installation]
```
sudo git clone https://github.com/k1lly-git/simple_file_tracker
cd simple_file_tracker

sudo cp tracker.sh /usr/local/bin/
sudo cp tracker.service tracker.timer /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable tracker.timer
sudo systemctl start tracker.timer
```

## [Where logs]
```
cat /var/log/tracker.log
```
