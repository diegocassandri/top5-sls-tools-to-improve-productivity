# 02-serverless-localstack

## Running

- First, you'll need to instance your LocalStack on Docker using `docker-compose up -d`
- Secondly, run `npm i` to restore dependencies
- Then, run `npx sls deploy`. It'll deploy the app on your local machine

## Testing using the Utils.sh

There are a few sections to help you test functions locally. On [./utils.sh](utils.sh) you'll find 3 sections, Global, S3 and Cloudwatch

### Gobal

it is an alias to avoid using the flag `--endpoint` on `aws` commands. Run it before all executions below.

### S3

Run all section on S3, to trigger your function locally.

## CloudWatch

Run all section in another terminal to visualize logs generated by your lambda.
