service monit stop
service freeswitch stop
psql -U root app_development -c "UPDATE freeswitch_calls set source='o' where start_stamp between '2017-04-30 00:00:00' and '2017-04-30 23:59:59'"
service postgresql stop
service cron stop
service nginx stop
service unicorn stop

timedatectl set-timezone Etc/UTC
cat /etc/timezone

cd /srv/dashboard
echo "o=Option.last; o.data['country_alpha3']='GBR'; o.save" | bundle exec rails c
sed -i 's/Rome/London/' config/application.rb

service cron start
service postgresql start
service freeswitch start
service unicorn start
service nginx start
service monit start
