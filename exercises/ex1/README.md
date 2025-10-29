# Exercise 1 - Production Readiness Checks

## Exercise 1 - Production Readiness Checks

**The Go/No-Go Decision Point**

With your incident management application deployed and the executive launch review just 48 hours away, it's time for the critical production readiness assessment. As the DevOps engineer responsible for the successful public launch, you cannot afford operational blind spots during the high-visibility go-live event.

**Your Mission:**
Systematically validate that your application and feedback microservice are properly instrumented, appropriately sized, and fully integrated with SAP's enterprise observability stack. This isn't just a technical checklist—it's your insurance policy against production failures.

**Product Readiness Assessment:**
You will be executing the following assessments as part of the exercise.
- [1.1 Platform health monitoring and log collection integrity](#11-check-basic-platform-monitoring-and-log-validation)
- [1.2 Instance sizing adequacy for expected load patterns  ](#12-check-instance-sizing-validation)
- [1.3 Full operational access and observability tool integration (SAP Cloud ALM, Cloud Logging)](#13-check-observability-tool-validation---sap-cloud-logging-and-sap-cloud-alm-connection-validation)
- [1.4 Emergency response procedures and CI/CD pipeline readiness](#14-check-automated-delivery)

Each check directly supports the operational excellence required for your upcoming launch, ensuring you have sizing, monitoring, and troubleshooting capabilities in place before real users depend on your system.

*Ready for your pre-flight inspection? Let's ensure you're truly launch-ready.*

## 1.1 Check: Basic Platform Monitoring and Log Validation

**Learning Opportunity**: Are basic monitoring capabilities functional through CF UIs?

- Access Cloud Foundry application monitoring through BTP Cockpit
- Review basic application metrics (CPU, memory, requests)
- Check application health status indicators
- Verify monitoring data is current and updating

#### Step 1. Check recent logs for your application

Inside the SAP BTP Cockpit click on Subaccount **[XP265_SHARED](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/subaccountoverview)**  
<br>![](/exercises/ex1/images/01_01_0001.png)  
* Click on Cloud Foundry - Spaces on the left side  
<br>![](/exercises/ex1/images/01_01_0002.png)
* Click on **XP265**   
* Click on Application **incident-management-srv**   
* Click on Logs on the left menu

  In the **[Application: incident-management-srv - Logs](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/app/d1fbbec7-6739-49db-a815-33927ad3b0ea/logs)** we can check the current application logs:  
<br>![](/exercises/ex1/images/01_01_0003.png)


#### Step 2. Check recent metrics for your application

* Click on Overview on the left menu

In the **[Application: incident-management-srv - Overview](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/app/d1fbbec7-6739-49db-a815-33927ad3b0ea/overview)** we can check the current application capacity utilization and events:  
<br>![](/exercises/ex1/images/01_01_0004.png)

#### Exercise Summary

**Result**: You can use these logs to identify and troubleshoot application-specific problems and check the 
container/runtime metrics provided by Cloud Foundry like the CPU utilization, memory usage, and disk usage per app instance, plus instance state.

**Background**:
The SAP BTP cockpit's Logs page displays application logs and related Cloud Foundry component logs for quick troubleshooting of recent application issues. For long-term log analytics, see [Exercise 2](../ex2/README.md) covering SAP Cloud Logging capabilities.


**Further References**:
* [SAP BTP Cloud Foundry - Using Application Logs](https://help.sap.com/docs/btp/sap-business-technology-platform/using-application-logs)
* [App logging in Cloud Foundry](https://docs.cloudfoundry.org/devguide/deploy-apps/streaming-logs.html)
* [Overview of Cloud Foundry Application Logs](https://developers.sap.com/tutorials/cp-cf-application-logs-overview..html)

## 1.2 Check: Instance Sizing Validation

**Learning Opportunity**: Is the application sufficiently sized with an adequate number of instances?

#### Step 1. Validate the number of Instances per Application

  Still within the **Application: incident-management-srv - Overview** we can explore how many instances of our application are started:  
<br>![](/exercises/ex1/images/01_02_0001.png)

#### Step 2. Explore the Memory and Disk Settings per Instance

- Navigate up one level to the list of Cloud Foundry Applications in BTP Cockpit
- Review each microservice application
- Check the **Instance Details** column for Disk and Memory per instance
- Check the **Instances** column shows minimum 2 running instances
- Cross-reference with application performance metrics if available

<br>![](/exercises/ex1/images/01_02_0002.png)

#### Exercise Summary

**Result**: Applications are running with minimum required instances for high availability. 

**Background**:
In SAP BTP Cloud Foundry, your applications run in containers that can be moved around by the platform at any time due to Diego container management and platform maintenance operations. When an application instance is moved or restarted, there's a brief period where it's not ready to handle requests.

To prevent users from experiencing failed requests during these transitions, always run at least 2 application instances simultaneously. This way, when one instance is being shut down and moved to another cell (compute node), the GoRouter (Cloud Foundry's load balancer) can automatically send incoming requests to the healthy instance that's still running. This ensures zero-downtime deployments and maintains service availability during platform operations.

Instance memory can be allocated up to the available disk space quota or up to the instance memory limit. Each application instance will be allocated the specified quota.


**Further References**:
* [Creating and modifiying quota plans in Cloud Foundry](https://docs.cloudfoundry.org/adminguide/quota-plans.html)
* [Increasing the Quota for dhe Cloud Foundry Runtime](https://help.sap.com/docs/btp/sap-business-technology-platform/increasing-quota-for-cloud-foundry-runtime-optional)


## 1.3 Check: Observability Tool Validation - SAP Cloud Logging and SAP Cloud ALM Connection Validation

**Learning Objectives:**
- Validate the connection of your apps to SAP Cloud ALM and SAP Cloud Logging for comprehensive observability
- Verify proper service bindings and configurations for log data collection
- Confirm that observability data is flowing correctly through the monitoring pipeline

**Prerequisites:**
- Access to SAP BTP Cockpit with appropriate permissions
- SAP Cloud ALM user onboarding completed


#### Step 1. Navigate to Cloud ALM Interface and Verify Access

**What you'll see:**
- SAP Cloud ALM onboarding email notification
- Cloud ALM Launchpad interface with navigation tiles
- Operations tab containing Real User Monitoring capabilities

**Actions to perform:**

1. **Check onboarding notification:**
   - Locate the Cloud ALM onboarding email in your inbox (We just display an example below)
   - Note the specific tenant and access details

    <br><img src="/exercises/ex2/images/02_01_0019.png" />

*SAP Cloud ALM onboarding email showing tenant access information*

2. **Access Cloud ALM Launchpad:**
   - Navigate directly to [SAP Cloud ALM](https://xp265-shared-4t2shozq.eu10-004.alm.cloud.sap/launchpad#Shell-home) Launchpad.
   - If prompted for additional authentication, select the identity provider line: `a8z641mqa.accounts.ondemand.com`

> [!IMPORTANT]
> Do *not* select **Default Identity Provider**

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_01_0020.png" />

<br><img src="/exercises/ex1/images/01_03_002.png" />

*Identity provider selection screen showing correct tenant selection*
</details>

3. **Verify Operations capabilities:**
   - Click on the **Operations** tab in the main navigation
   - Confirm that **Real User Monitoring** tile is visible and accessible
   - This validates that Cloud ALM is properly configured for application performance monitoring

    <br><img src="/exercises/ex1/images/01_03_003.png" />

*Cloud ALM interface showing Operations tab with Real User Monitoring capability*

**Key Capabilities Demonstrated:**
- SAP Cloud ALM tenant access and authentication
- Real User Monitoring for frontend observability

> [!NOTE]
>  [Exercise 2](../ex2/README.md) will provide deep-dive exploration of SAP Cloud ALM capabilities for comprehensive observability analysis.

#### Step 2. Validate Cloud Logging Service Instance Configuration

**What you'll see:**
- SAP BTP Cockpit service instances overview
- Cloud Logging service instance details with binding information
- Service plan configuration of SAP Cloud Logging

**Actions to perform:**

1. **Navigate to Cloud Logging instance:**
   - Access BTP Cockpit and navigate to your Cloud Foundry space
   - Go to **Services** → **Service Instances**
   - Locate the Cloud Logging service instance

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex1/images/01_03_0004.png" />

*BTP Cockpit navigation path to Cloud Logging service instances*
</details>

   - Alternatively, use direct link to [instance view](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/service-instances&//?layout=OneColumn)

<br><img src="/exercises/ex1/images/01_03_0005.png" />

*Service instances overview and where to select "SAP Cloud Logging"*

2. **Validate service plan capacity & application binding:**
   - Click on the main Cloud Logging service instance to [open details](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/service-instances&//detail/e1bf1f9f-be6a-4a59-9980-0918531dd856/?layout=TwoColumnsMidExpanded)
   - Verify the **Service Plan** shows "standard" or "large"
   - Verify the **Bound Application** shows "incident-management-srv" and "incident-feedback-srv"

    <br><img src="/exercises/ex1/images/01_03_0007.png" />

*Service plan details showing production-ready configuration, bound applications and service plan names*

> [!IMPORTANT]
> The SAP Cloud Logging service plans "Standard" and "Large" provide production-level log retention, search capabilities, and performance suitable for enterprise observability requirements.
> Do not use the "dev" service plan for productive workload.


#### Step 3. Verify Log Data Flow in Cloud Logging

**What you'll see:**
- OpenSearch Dashboards interface within Cloud Logging
- Discover view showing incoming log messages
- Real-time log data from bound applications

**Actions to perform:**

1. **Access Cloud Logging interface:**
   - From the service instance details above, click on the link "xp265-cl" in the beginning of the row OR navigate directly to the main [Cloud Logging Service (CLS)](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards#/view/maintained-by-perfx_using-your-instance-content-package_Using-your-CLS-instance?_g=h@42b0d52&_a=h@d44a38c) interface
   - Select the **[Discover](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/data-explorer/discover#?_a=h@b1ee6ce&_g=h@42b0d52&_q=h@fd5d437)** tab (burger menue to the top left) to navigate to the log message flow

    <br><img src="/exercises/ex1/images/01_03_0008.png" />

*Cloud Logging Discover interface showing active log message ingestion*

2. **Validate log message arrival:**
   - Confirm that log messages are actively flowing into the system
   - Check timestamp freshness to verify real-time data collection

**Technical Context:** The "Discover" interface is built on OpenSearch Dashboards, providing powerful log search, filtering, and analysis capabilities. This validates that the complete observability pipeline from applications through SAP Cloud Logging is functioning correctly.

> [!NOTE]
>  [Exercise 2](../ex2/README.md) will provide deep-dive exploration of SAP Cloud Logging capabilities for comprehensive observability analysis.


#### Exercise Summary


**Result:** ✅ SAP Cloud Logging and SAP Cloud ALM is properly connected and receiving observability data from BTP applications.

**Technical Benefits:**
- **Unified Observability**: Entry points for Central and Local Observability use cases via SAP Cloud ALM and SAP Cloud Logging.
- **Optimized Log Delivery**: https-batch channel provides efficient, low-latency log transmission
- **Enterprise-Scale Monitoring**: Standard/Large service plans support production workload observability
- **Real-Time Insights**: Immediate visibility into application behavior and system health

**Background:**

In SAP BTP's Cloud Foundry environment, applications run as containers that can be automatically relocated or restarted by the Diego runtime during platform maintenance or scaling operations. This dynamic infrastructure creates unique observability challenges that require specialized monitoring approaches.

SAP Cloud ALM is a cloud-native application lifecycle management solution included in Enterprise and Large Enterprise Support plans. It provides comprehensive governance for hybrid and cloud solutions on SAP BTP with guided setup and automation capabilities. Cloud ALM integrates with SAP Cloud Logging to enable deep-dive analysis and end-to-end monitoring across distributed systems, allowing drill-down from high-level metrics into specific application behaviors like the incident-management-srv service workload.

SAP Cloud Logging is built on OpenSearch's distributed analytics engine, providing real-time log indexing, full-text search, and advanced filtering for high-volume structured and unstructured log data across SAP BTP environments. The service supports W3C Trace Context and OpenTelemetry standards for distributed tracing correlation across microservices architectures.

This unified observability approach ensures continuous monitoring coverage despite Cloud Foundry's dynamic container orchestration, providing persistent visibility into application behavior regardless of underlying infrastructure changes.


**Further References:**
- [SAP Cloud ALM Documentation](https://support.sap.com/en/alm/sap-cloud-alm/operations/expert-portal.html)
- [SAP Cloud ALM onboarding and instrumentation](https://support.sap.com/en/alm/sap-cloud-alm/operations/expert-portal/data-collection-infrastructure.html)
- [SAP Cloud Logging Service Guide](https://help.sap.com/docs/cloud-logging)
- [BTP Developer Guide on Observability](https://help.sap.com/docs/BTP/0c8c1db388f645159e134a005aaabbcf/34065a44e2ef4907a7482221ce3383ec.html?locale=en-US&state=PRODUCTION&version=Cloud)


## 1.4 Check: Automated Delivery

**Learning Opportunity**: Verify that deployments are fully automated

#### Step 1: Automated integration and delivery pipelines

**What you'll see:**
- SAP BTP Cockpit Instances and Subscriptions overview
- Continuous Integration and Delivery application 
- CI/CD success job run

**Actions to perform:**

1. **Navigate to Continuous Integration and Delivery application:**
   - Access BTP Cockpit and navigate to your Cloud Foundry space
   - Go to **Services** → **Instances and Subscriptions**
   - Locate the Application → "**[Continuous Integration and Delivery](https://xp265-shared-4t2shozq.eu10.cicd.cloud.sap/ui/index.html)**"

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex1/images/01_04_0001.png" />
    <br><img src="/exercises/ex1/images/01_04_0002.png" />
    <br><img src="/exercises/ex1/images/01_04_0003.png" />
    <br><img src="/exercises/ex1/images/01_04_0004.png" />
    <br><img src="/exercises/ex1/images/01_04_0005.png" />

*BTP Cockpit navigation path to Continuous Integration and Delivery application* 
</details>    


Automated CI/CD pipelines help you to validate changes and updates of your app automatically. A comprehensive set of unit and integration tests with reasonable test coverage will help to detect regressions quickly and with minimal effort. To set up your own CI/CD pipelines using SAP Continuous Integration and Delivery:

<br><img src="/exercises/ex1/images/01_04_0006.png" />


#### Exercise Summary

**Result**: Improved validation and delivery is automated using SAP Continuous Integration and Delivery.

**Background**:
After GA, changes are still made to the application. New features, security patches and version updates need to be validated and deployed. Setting up CI/CD pipelines to automate these tasks reduces maintenance efforts significantly.

**Further References**:
* [SAP Continuous Integration and Delivery](https://help.sap.com/docs/continuous-integration-and-delivery?locale=en-US)
* [Get Started with an SAP Fiori Project in SAP Continuous Integration and Delivery](https://developers.sap.com/tutorials/cicd-start-fiori..html)

## Summary

Your production readiness validation confirms your system is properly configured and enterprise-ready. But here's the reality: passing pre-flight checks is just the beginning. When your application goes live in 48 hours, the real operational challenge begins—and that's where most teams stumble.

*Time to level up from deployment-ready to operations-mastery. - Continue to - [Exercise 2 -  Observability](../ex2/README.md)*
