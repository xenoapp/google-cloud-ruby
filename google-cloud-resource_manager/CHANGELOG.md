# Release History

### 0.32.0 / 2019-09-16

#### Features

* Support overriding of service endpoint

### 0.31.1 / 2019-08-23

#### Documentation

* Update documentation

### 0.31.0 / 2019-02-12

* Add parent resoure to `Project`:
  * Add `Project#parent`.
  * Add `parent` optional named argument to `Manager#create_project`.
  * Add `Resource` class.
  * Add `Manager#resource` convenience method.

### 0.30.3 / 2018-09-20

* Update documentation.
  * Change documentation URL to googleapis GitHub org.
* Fix circular require warning.

### 0.30.2 / 2018-09-12

* Add missing documentation files to package.

### 0.30.1 / 2018-09-10

* Update documentation.

### 0.30.0 / 2018-06-22

* Update Policy, protect from role duplication.
* Updated dependencies.

### 0.29.0 / 2018-02-27

* Support Shared Configuration.
* Fix issue with IAM Policy not refreshing properly.
* Update Google API Client dependency.

### 0.28.0 / 2017-11-14

* Add `Google::Cloud::ResourceManager::Credentials` class.
* Rename constructor arguments to `project_id` and `credentials`.
  (The previous arguments `project` and `keyfile` are still supported.)
* Document `Google::Auth::Credentials` as `credentials` value.
* Updated `google-api-client`, `googleauth` dependencies.

### 0.27.0 / 2017-09-28

* Update Google API Client dependency to 0.14.x.

### 0.26.0 / 2017-06-27

* Upgrade dependency on Google API Client

### 0.25.0 / 2017-06-01

* Fix apiary client argument case.
* Update gem spec homepage links.
* Remove memoization of Policy.
* Remove force parameter from Project#policy.
* Remove Policy#deep_dup.

### 0.24.1 / 2017-04-06

* Fix error due to missing require.

### 0.24.0 / 2017-04-05

* Upgrade dependency on Google API Client

### 0.23.0 / 2017-03-31

* Updated documentation

### 0.22.0 / 2017-03-03

* Dependency on Google API Client has been updated to 0.10.x.

### 0.21.0 / 2016-10-20

* New service constructor Google::Cloud::ResourceManager.new

### 0.20.1 / 2016-09-02

* Fix for timeout on uploads.

### 0.20.0 / 2016-08-26

This gem contains the Google Cloud Resource Manager service implementation for the `google-cloud` gem. The `google-cloud` gem replaces the old `gcloud` gem. Legacy code can continue to use the `gcloud` gem.

* Namespace is now `Google::Cloud`
* The `google-cloud` gem is now an umbrella package for individual gems
