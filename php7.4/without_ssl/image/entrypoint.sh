#!/bin/bash

# Clearing cache
if [ -d "/var/www/html/vendor" ]
then
    echo "Clearing cache"
    php /var/www/html/artisan optimize:clear
else
    echo "Composer not found, Kindly composer install to run the application"
fi

# Sending slack notification
slack_webhook=`cat /var/www/html/image/slack/GCP_NOTIFIER_SLACK_CHANNEL_WEBHOOK.txt`

if [ -z "$slack_webhook" ]
then
    echo "\$GCP_NOTIFIER_SLACK_CHANNEL_WEBHOOK.txt is set empty, please set it to receive server notification in slack channel."
else
    echo "Sending slack notification"
    curl -X POST -H 'Content-type: application/json' --data '{"text":"#################################\n\n\n   Server Restart complete!    \n\n\n#################################"}' $slack_webhook
fi

# Running the supervisor to start the application
/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
