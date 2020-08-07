# Global
alias awslocal="aws --endpoint-url=http://localhost:4566"

# S3
BUCKETNAME=reports
FILE_PATH=mock.csv
echo "name,number\nErick,123" > $FILE_PATH

awslocal s3 mb s3://$BUCKETNAME
awslocal s3 ls s3://$BUCKETNAME
awslocal s3 cp $FILE_PATH s3://$BUCKETNAME

# CloudWatch
APP_NAME=serverless-localstack-example
LOG_GROUP=$(awslocal logs describe-log-groups \
    | \
    jq -r '.logGroups[0].logGroupName' \
    | grep $APP_NAME
)

LOGS=$(awslocal logs describe-log-streams \
        --log-group-name $LOG_GROUP \
        | \
        jq -r '.logStreams[].logStreamName'
)
for log in $(printf '%s\n' "${LOGS[@]}"); do
    echo 'logging' $log
    awslocal logs get-log-events \
        --log-group-name $LOG_GROUP \
        --log-stream-name $log \
        | \
        jq -r '.events[].message'
done

