# DataDog Monitors #

This repository is used to store all our monitors templates.

Here is the repository organization:

- cloud
    - aws
        - [alb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/alb/)
        - [apigateway](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/apigateway/)
        - [elasticsearch](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elasticsearch/)
        - [elb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/elb/)
        - [kinesis-firehose](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/kinesis-firehose/)
        - [rds](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/rds/)
        - [vpn](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/aws/vpn/)
    - azure
        - [apimanagement](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/apimanagement)
        - [app-services](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/app-services/r)
        - [eventhub](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/eventhub/)
        - [iothubs](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/iothubs/)
        - [redis](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/redis/)
        - [sql-database](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/sql-database/)
        - [storage](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/storage/)
        - [stream-analytics](https://bitbucket.org/morea/terraform.feature.datadog/src/master/cloud/azure/stream-analytics/)
- common
    - [alerting-message](https://bitbucket.org/morea/terraform.feature.datadog/src/master/common/alerting-message/)
- databases
    - [mongodb](https://bitbucket.org/morea/terraform.feature.datadog/src/master/databases/mongodb/)
- incubator
- middleware
    - [apache](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/apache/)
    - [nginx](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/nginx/)
    - [php-fpm](https://bitbucket.org/morea/terraform.feature.datadog/src/master/middleware/php-fpm/)
- system
    - [generic](https://bitbucket.org/morea/terraform.feature.datadog/src/master/system/generic/)


### How to contribute ? ###

First, you may refresh your knowledge and look at the [terminology](https://confluence.fr.clara.net/display/DAT/Getting+started).

To contribute you will need to [report an issue](https://confluence.fr.clara.net/display/DAT/Project+and+Workflow).

If you would like to resolve an issue or implement new monitors you must follow our [best practices](https://confluence.fr.clara.net/display/DAT/Templates+monitors).

### Important notes ###

* This repository represents a terraform feature and each first level directory could be imported as a terraform module, you must choose the one(s) you need.
* Each of these modules contains the most commons monitors, but they probably not fulfill all your customer needs
* You still can create some specific DataDog monitors after importing a module, it's even advisable to complete your needs
* You will find a complete `README.md` on each module, explaining how to use it.
* The `alerting-message` module could be used to easily generate a templating message to use by default but it could be used also multiple times to generate messages for specific monitors.

### The DataDog provider ###

Before importing some modules, you must define the DataDog provider in your `main.tf`

```
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

Both of the `datadog_api_key` and `datadog_app_key` are unique to the client.

### Module Declaration example ###

 A quick example of using a set of monitors:

```
module "datadog-monitors-my-monitors-set" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//my/monitors/set?ref={revision}"

  environment = "${var.environment}"
  message = "${module.datadog-message-alerting.alerting-message}"
}
```

`my/monitors/set` represents the path to an monitors set directory listed above.  
The `//` is very important, it's a terraform specific syntax used to separate git url and folder path.
