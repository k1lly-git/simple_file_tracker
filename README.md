# simple_file_tracker

## [Installation]
```
git clone https://github.com/k1lly-git/simple_file_tracker
cd simple_file_tracker

sed -i s/LOCAL_USER=\"USER\"/LOCAL_USER=\"$USER\"/ "tracker.sh"

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

https://github.com/k1lly-git/simple_file_tracker/assets/137339966/cfb045fe-a9fb-4704-b8e3-065c5d2ecebf

## [CPU Test]

https://github.com/k1lly-git/simple_file_tracker/assets/137339966/dee7b425-ffa9-44d9-930b-3ee67666ca44

