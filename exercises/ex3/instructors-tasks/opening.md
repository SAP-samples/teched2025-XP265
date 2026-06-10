
## Opening

In Exercise 1, you validated your application's health. In Exercise 2, you built observability with Cloud Logging and Cloud ALM. Now comes the question every stakeholder will ask before go-live.

Can your system handle the load ? What happens when 10,000 users hit this at once ?

Today, we're going to break things - on purpose - and watch how SAP BTP's Application Autoscaler keeps your application alive


## System at REST - CAlM State

Show the current state of the application instances
Two instancce, Two instances. That's our minimum. This is your application on a quiet Sunday morning,  sipping coffee, handling normal traffic, keeping costs low

But here's the scenario: A major incident just occurred at your company. HR sent this notification to every employee.
Notification:
 "We would like to inform you that a major incident has occurred. Please click the Incident Management Application to learn more."

What do you thinks, what happends if 5000 employees hit the link at the same time ?


# SHOW The Policy

before we dive into the load , lets understand the our safetly ned. This is our autoscaling policy



# Apply the load

lright. Time to simulate the storm. I'm going to use a load testing tool called 'oha' to send hundreds of concurrent requests to our application.
In real life, this would be those 5000 empployess cicking the incident link 

Load is now hitting the application. Watch the terminal - you can see requests flowing.

while we wait, let me explain what's happening under the hood:

The Application Autoscaler service is continuously polling metrics from your application. Right now, it's seeing throughput climb above our 40 requests-per-second threshold.

It started a timer. If throughput stays above 40 for a full 60 seconds, it triggers the scaling action.
This is production-grade behavior. You don't want your infrastructure reacting to every traffic hiccup."

Now, we should be seeing the momvent anytime soon. Here you go, 
No pager alerts. No 3 AM wake-up call. No manual intervention. The platform handled it.

If scaled to 5:
And there's our ceiling - 5 instances. The autoscaler won't go beyond this because we set that as our maximum. This is your cost control guardrail.



# CALM State

Stop the load test. The strom has passed. But wait, watch what happens next, this is the part which your finance team wil be proud of

Remember the scale down rule ? 

In about 3 minutes, you'll see instances drop from 5 back down toward our minimum of 2. That's automatic cost optimization - you're not paying for capacity you don't need.


"If we don't have time to wait, trust me - or check back after the session. Your instances will be back to 2."


## CLOSING

"When your stakeholder asks 'Can it handle our growth?' - you don't guess. You don't hope. You show them data."

"Congratulations - your application is production-ready."
