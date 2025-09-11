# Exercise 3 - Application Scaling 

TODO: 
 - Status - Draft
 - Pictures for each step
 - Correct Application links

In this exercise, we will scale the Incident Management application using Application Autoscaler service, provided by SAP Business Technology Platform (BTP), which helps to react to changing application requirements, providing resilience and optimal resource utilization.

# Scenario

Your team has developed a beautiful CAP based Incident Management application. The application enables employees to
report IT issues, facility problems or other incidents quickly. The app has been just deployed on SAP Business Technology Platform (BTP) and today is the official go-live day.

To announce the launch, your company has sent out a newsletter to all employees.

> Congratulations! Your Incident Management application Portal is now live - click [here](http://example.com) to report any issues you encounter.

A few hours after the newsletter has been sent out, hundreds (maybe thousands) of employees started reporting incidents by
accessing the Incident Management application (via the link provided in the newsletter) at the same time. As a result, a huge number of
requests (traffic) hit the application, leading to a sudden spike in applications resource
usage (CPU, memory)

For the purpose of this exercise, we will simulate the traffic spike by sending multiple requests to the application via
a command line tool called hey. Checkout the [installation guide](https://github.com/rakyll/hey?tab=readme-ov-file#installation) of hey, if you don't have it installed already.

By the end of the exercise, you will learn how to keep your application reliable and responsive during traffic spikes by leveraging the autoscaling capabilities of the SAP BTP Cloud Foundry runtime.

## Exercise 3.1 Check Application Status

First, check the status of the application deployed SAP Business Technology Platform (BTP) environment. Perform the following steps if not done already.Otherwise, head to the next section.

1. Login with your BTP account and navigate to the [SAP Business Technology Platform - Cockpit](https://emea.cockpit.btp.cloud.sap/cockpit?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/accountModel&//?section=SubaccountsSection&view=TilesView)
2.  A sign In screen will appear. Enter your credentials provided by your lab instructor and click on "Continue"
 
3. Navigate to the [incident-management-srv application](https://emea.cockpit.btp.cloud.sap/cockpit?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/app/d1fbbec7-6739-49db-a815-33927ad3b0ea/overview) to view application overview page

4. Now, look of the current application instances in "Instances" section. There should be only one instance running of your application

## Exercise 3.2 Verify the Application Scaling Policy

Next, verify the application scaling policy configured for the application by using Application Autoscaler Dashboard

1. Navigate to the [Application Autoscaler Dashboard](https://application-autoscaler-dashboard.cf.eu10-004.hana.ondemand.com/manage/46ff4060-6ae4-47dd-b2a7-5a188b5780b4).
2. Login with your BTP account credentials provided by your lab instructor and click on "Sign in with alternative identity provider"
     >  origin key: `a8z641mqa-platform`

   1. ![03-2.2-sign-in.png](images%2F03-2.2-sign-in.png)
    
3. Click on "Referencing Apps" in the left navigation pane
4. You will see the list of applications configured for autoscaling. Click on the "manage policy" under "Actions" column to view the configured scaling policy for the application named "incident-management-srv"

```json
{
	"instance_min_count": 1,
	"instance_max_count": 5,
	"scaling_rules": [
		{
			"metric_type": "throughput",
			"breach_duration_secs": 120,
			"threshold": 70,
			"operator": ">=",
			"cool_down_secs": 300,
			"adjustment": "+1"
		},
		{
			"metric_type": "throughput",
			"breach_duration_secs": 180,
			"threshold": 50,
			"operator": "<",
			"cool_down_secs": 300,
			"adjustment": "-1"
		}
	]
}

```

The scaling policy above indicates that the application can scale between 1 and 5 instances based on the throughput metric. If the throughput exceeds 70 requests per second for a duration of 120 seconds, the application will scale up by 1 instance. Conversely, if the throughput drops below 50 requests per second for a duration of 180 seconds, the application will scale down by 1 instance


## Exercise 3.3 Simulate Traffic Spike

Instead of actually sending a newsletter to all employees, we will simulate the traffic spike by sending multiple requests to the application using a command line tool called `hey`. This result in a sudden increase in the application's resource usage (CPU, memory), which will trigger the autoscaling mechanism based on the configured scaling policy.

>  Make sure that you have already installed hey CLI utility. Just type 'hey' in terminal or command prompt 

1. Open a terminal or command prompt on your local machine
2. Execute the following command:

```bash
$ hey -z 3m -c 20 https://xp265-shared-4t2shozq.launchpad.cfapps.eu10.hana.ondemand.com/site?siteId=f7652fdf-d61e-4cec-95d9-bcd5e64fc13c#incidents-display?sap-ui-app-id-hint=saas_approuter_ukrs01.incidents&/?sap-iapp-state=TAS1LR6TOCWJTQLQQG421CCSSCBH610QPYEH7HF46
```
Above command will send requests to the application for a duration of 3 minutes with 20 connections (users)

## Exercise 3.4 Verify Application Scaling

In this exercise, you will verify that the application scales up and down based on the configured scaling policy.
This can be done in two ways:

1. Using SAP Business Technology Platform - Cockpit

   1. Navigate back to the [incident-management-srv application](https://emea.cockpit.btp.cloud.sap/cockpit?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/app/d1fbbec7-6739-49db-a815-33927ad3b0ea/overview) to view application overview page
   2. Observe the number of instances in the "Instances" section
   3. You should see the number of instances increasing as the application scales up to handle the increased traffic
2. Using the Application Autoscaler Dashboard
   1. Navigate to the [Application Autoscaler Dashboard](https://application-autoscaler-dashboard.cf.eu10-004.hana.ondemand.com/manage/46ff4060-6ae4-47dd-b2a7-5a188b5780b4)
   2. Login with your BTP account credentials provided by your lab instructor
   3. Click on Referencing Apps in the left navigation pane
   4. You will see the list of applications configured for autoscaling. Click on the "history" under actions to view the scaling history of the application named "incident-management-srv"


## Summary

You have now completed the exercise and learned how to leverage the autoscaling capabilities of SAP Business Technology Platform (BTP) to keep your application reliable and responsive during traffic spikes. By configuring an appropriate scaling policy, you can ensure that your application scales up and down based on demand, providing optimal resource utilization and cost efficiency.


