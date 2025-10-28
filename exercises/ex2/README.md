# Exercise 2 - Observability

**Mission Control: Gaining Operational Intelligence**

Your production readiness checks are complete, but now comes the real test: Can you actually *see* what's happening inside your system when it matters most? During your upcoming public launch, you'll need more than basic monitoring—you need deep operational intelligence to proactively identify issues and respond faster than problems can escalate.

**Your Challenge:**
Transform from blind faith to data-driven confidence by championing SAP BTP's enterprise observability capabilities. You'll dive deep into your incident management application's runtime behavior, learning to interpret the signals that separate healthy systems from those heading toward failure.

**Operational Intelligence Toolkit:**
- **SAP Cloud ALM Central Observability** - See your application through actual user experiences and catch performance degradation before complaints arrive
- **SAP Cloud Logging Analytics** - Decode system state from log patterns and trace distributed requests across your microservices architecture  

**The Stakes:**
When your system goes public and real users start creating incidents, you need to distinguish between normal traffic spikes and actual problems. Champion these observability tools now, because during a production incident, your monitoring dashboards become your mission control center.

*Ready to see through your system's eyes? Let's build your operational intelligence.*


<details>
<summary>Unfold to see the "Table of Contents" of the following Exercises</summary>

- [Exercise 2 - Observability](#exercise-2---observability)
      - [Prerequisites](#prerequisites)
  - [2.1 SAP Cloud ALM - Central Observability with Real User Monitoring](#21-sap-cloud-alm---central-observability-with-real-user-monitoring)
      - [Prerequisites](#prerequisites-1)
      - [Step 1. Navigate to the real-user monitoring tile in SAP Cloud ALM](#step-1-navigate-to-the-real-user-monitoring-tile-in-sap-cloud-alm)
      - [Step 2. Select the Workzone component](#step-2-select-the-workzone-component)
      - [Step 3. Review an individual requests executed by synthetic clients](#step-3-review-an-individual-requests-executed-by-synthetic-clients)
      - [Step 4. Explore the single transaction](#step-4-explore-the-single-transaction)
      - [Step 5. Check availability of a navigation link towards SAP Cloud Logging Service](#step-5-check-availability-of-a-navigation-link-towards-sap-cloud-logging-service)
      - [Exercise Summary](#exercise-summary)
  - [2.2 SAP Cloud Logging - Overall System State](#22-sap-cloud-logging---overall-system-state)
      - [Prerequisite](#prerequisite)
      - [Step 1. Navigate to SAP Cloud Logging](#step-1-navigate-to-sap-cloud-logging)
      - [Step 2: Access SAP Cloud Logging and navigate to the Cloud Foundry Observability Dashboard](#step-2-access-sap-cloud-logging-and-navigate-to-the-cloud-foundry-observability-dashboard)
      - [Step 3. Explore the "CF Overview" Dashboard](#step-3-explore-the-cf-overview-dashboard)
      - [Step 4. Review the other dashboards available within SAP Cloud Logging](#step-4-review-the-other-dashboards-available-within-sap-cloud-logging)
      - [Exercise Summary](#exercise-summary-1)
  - [2.3 SAP Cloud Logging - Log Analytics Interface](#23-sap-cloud-logging---log-analytics-interface)
      - [Step 1. Analyze the "Requests and Logs" dashboard](#step-1-analyze-the-requests-and-logs-dashboard)
      - [Step 2. Investigate Runtime Logs for Deployment and Platform Events](#step-2-investigate-runtime-logs-for-deployment-and-platform-events)
      - [Step 3. Correlate Requests and Application Logs Using Trace ID](#step-3-correlate-requests-and-application-logs-using-trace-id)
      - [Exercise Summary](#exercise-summary-2)
  - [2.4 SAP Cloud Logging - Distributed System Monitoring - Four Golden Signals](#24-sap-cloud-logging---distributed-system-monitoring---four-golden-signals)
      - [Step 1. Navigate and explore the Four Golden Signals dashboard overview](#step-1-navigate-and-explore-the-four-golden-signals-dashboard-overview)
      - [Step 2. Analyze latency metrics and perform detailed trend analysis](#step-2-analyze-latency-metrics-and-perform-detailed-trend-analysis)
      - [Step 3. Monitor traffic volume and payload indicators](#step-3-monitor-traffic-volume-and-payload-indicators)
      - [Step 4. Examine error rate monitoring and status code analysis](#step-4-examine-error-rate-monitoring-and-status-code-analysis)
      - [Step 5. Review container metrics and resource utilization](#step-5-review-container-metrics-and-resource-utilization)
      - [Exercise Summary](#exercise-summary-3)
  - [2.5 SAP Cloud Logging - Distributed System Monitoring - Trace Analytics with OpenTelemetry](#25-sap-cloud-logging---distributed-system-monitoring---trace-analytics-with-opentelemetry)
      - [Step X. Access "Observability" -\> "Traces" and there "Service" and "Trace"](#step-x-access-observability---traces-and-there-service-and-trace)
      - [Step X. Check the detected services in the selected timeframe - increase the timeframe to 1h](#step-x-check-the-detected-services-in-the-selected-timeframe---increase-the-timeframe-to-1h)
      - [Step X. Switch to Traces - Filter and sort the list of traces](#step-x-switch-to-traces---filter-and-sort-the-list-of-traces)
      - [Step X. Select a specific Trace Group](#step-x-select-a-specific-trace-group)
      - [Step X. Display a trace](#step-x-display-a-trace)
  - [Summary](#summary)
</details>

#### Prerequisites

Login to the system as described in the [General Section](../ex0/README.md#start-here-and-get-access-to-the-backend-system-and-btp-cockpit)


## 2.1 SAP Cloud ALM - Central Observability with Real User Monitoring


**Learning Opportunity**: After completing these steps you will be able to understand how user interact with your system landscape

#### Prerequisites

Upon successful onboarding to SAP Cloud ALM, your organization will receive a confirmation email containing the navigation path and access details for your dedicated tenant (see screenshot example below).

<details>
    <summary>📷💡 View example Onboarding Email</summary>
    <br><img src="/exercises/ex2/images/02_01_0019.png" />

*Example of an onboarding Email - just provided as example*
</details>

For This Exercise a direct link to the SAP Cloud ALM tenant is provided below for convenience during this hands-on session. You don't need to access your Email-program.

> [!NOTE]
> In production environments, always use the official tenant URL provided in your individual onboarding email of your Company.

#### Step 1. Navigate to the [real-user monitoring tile](https://xp265-shared-4t2shozq.eu10-004.alm.cloud.sap/shell/run?sap-ui-app-id=sap.crun.rum.ui) in SAP Cloud ALM
if you are prompted for a additional Sign In, select the line stating ```a8z641mqa.accounts.ondemand.com```and NOT the ```Default Identity Provider```

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_01_0020.png" />
</details>


#### Step 2. Select the Workzone component

 If you open the Real User Monitoring app the first time, you will be prompted to select the ```Select a Scope``` - select ```XP265_WZ```.

> [!NOTE]
> At any subsequent login, the Real User Monitoring app will directly show a previously selected Scope. To modify this, use the "Scope Selection" via the "Scope"-icon in the top navigation bar to the right. 

<br><img src="/exercises/ex2/images/02_01_0021.png" />

Our app is regularly checked with a synthetic browser monitor and a scenario of Incident Management is being clicked through. While the browser sees the workzone component initially, internally calls are being made to backend components, the database and the S4/HANA system.

#### Step 3. Review an individual requests executed by synthetic clients

Drill down on the ```ukrs01.incidents``` request and select the ```oterBar::StandardAction::Save_press``` action. When the save action is pressed, an incident has a change status, respective backend-calls and database statements persisting the new status can be seen.

<br><img src="/exercises/ex2/images/02_01_0022.png" />
<br><img src="/exercises/ex2/images/02_01_0023.png" />

You can as well find a recent direct link to a good example [here](https://xp265-shared-4t2shozq.eu10-004.alm.cloud.sap/shell/run?sap-ui-app-id=sap.crun.rum.ui#/Requests/Actions/Executions/91af64fb-5132-fa85-0000-0000154ec084/?ExecutionTimestamp=2025-10-28T14:45:20Z&ExecutionType=S&NAME1=ukrs01.incidents&NAME2=oterBar%25253A%25253AStandardAction%25253A%25253ASave_press&RECTYPE=SAP_UI5&Scopes=&TimeFrame=INHERIT&User=).

<br><img src="/exercises/ex2/images/02_01_0024.png" />


#### Step 4. Explore the single transaction

The diagram displays all components and their interactions. Hover over different tiles to explore relevant KPIs including response times, transaction identifiers, request sizes, and more.

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_01_0025.png" />
</details>


Use your mouse to zoom out and pan to understand the complete transaction flow from frontend to backends.

Use the "Timeline" view (top right) to consolidate traces and expand specific sections (e.g., database spans) for detailed performance analysis. 

Then deselect the "Timeline" view again and navigate to "Orientation: Left to Right" (2 icons to the left).

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_01_0026.png" />
</details>


While the Workzone component is a SaaS service provided by SAP, your team is responsible for the ```incident-management-srv``` app. In the next step, we'll switch from Central Observability to Local Observability using SAP Cloud Logging.


#### Step 5. Check availability of a navigation link towards SAP Cloud Logging Service

On the ```incident-management-srv``` tile, click the link icon and select ```Show detailed trace in Cloud Logging``` from the popup menu.

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_01_0027.png" />
</details>


This opens the detailed transaction trace showing how the incident-management-srv app executed the request. You'll see the individual OpenTelemetry spans and their processing times.

<br><img src="/exercises/ex2/images/02_01_0028.png" />

#### Exercise Summary
**Result**: Visibility into User-interactions with current status information for the deployed workload

**Background**:
SAP Cloud ALM is a cloud-based application lifecycle management tool included in SAP Cloud Service plans like Enterprise and Large Enterprise Support. It helps organizations manage hybrid and cloud solutions on SAP BTP with guided setup and automation for SAP and custom apps. SAP Cloud ALM is integrated with SAP Cloud Logging for deep dive analysis in various scenarios. In this case it allows further drill-down into the end2end transaction and BTP workload of the ```incident-management-srv``` application for distributed system monitoring (part of this [exercise](#25-sap-cloud-logging---distributed-system-monitoring---trace-analytics-with-opentelemetry))

**Further References**:
- https://support.sap.com/en/alm/sap-cloud-alm/operations/expert-portal.html
- https://support.sap.com/en/alm/sap-cloud-alm/operations/expert-portal/real-user-monitoring.html
- https://help.sap.com/docs/cloud-alm/applicationhelp/real-user-monitoring


## 2.2 SAP Cloud Logging - Overall System State

**Learning Opportunity**: After completing these steps you will be able to monitor key aspects of the distributed system monitoring

**What you'll see:**
- Service introduction panel
- Multiple navigation tiles for different observability capabilities
- Various dashboard options for different SAP BTP environments

**Focus for this Exercise**
In this hands-on session, we will concentrate specifically on the **Cloud Foundry** dashboard capabilities, which will enable you to:
- ✅ Analyze application logs
- ✅ Correlate logs with specific requests  
- ✅ Discover insights derived from request log aggregations


#### Prerequisite

Complete the previous exercise or navigate directly through the [BTP Cockpit](https://emea.cockpit.btp.cloud.sap/cockpit/?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/subaccount/52fbaf37-c604-4abf-8580-c97703835dc8/org/6c903df1-d869-4d7d-8483-6f306d5962c7/space/0cb720c5-4bc3-4eb6-8b93-60f0f4d23904/service-instances):

1. Navigate to the **Instances** section
2. Locate the **Cloud Logging** service entry
3. Click on `xp265-cl` in the first column

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_02_0020.png" />
</details>

When accessing SAP Cloud Logging for the first time, you may need to authenticate. Follow the sign-in process outlined in the [General Section](../ex0/README.md#start-here-and-get-access-to-the-backend-system-and-btp-cockpit) using your assigned credentials.

#### Step 1. Navigate to SAP Cloud Logging

To start this exercise select the ```Global``` tenant (if prompted) and navigate to the Dashboard called "[Using Cloud Logging](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards#/view/maintained-by-perfx_using-your-instance-content-package_Using-your-CLS-instance?_g=h@42b0d52&_a=h@d44a38c)".


<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_02_0019.png" />

*Tenant selection screen*
    <br><img src="/exercises/ex2/images/02_02_0021.png" />

*Navigation path towards the Landingpage "Using Cloud Logging"*

</details>


#### Step 2: Access SAP Cloud Logging and navigate to the Cloud Foundry Observability Dashboard

Upon successful login, you should see the landing page "[Using Cloud Logging](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_using-your-instance-content-package_Using-your-CLS-instance?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Provides%20pointers%20on%20what%20can%20be%20done%20with%20your%20CLS%20instance%20%5Bmaintained%20by%20cls%20team%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!t,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'Using%20your%20SAP%20Cloud%20Logging%20instance',viewMode:view))" with an introduction to the service and multiple navigation options for different capabilities.

<br><img src="/exercises/ex2/images/02_02_0022.png" />

*Main SAP Cloud Logging Landing Page showing available capabilities*


#### Step 3. Explore the "CF Overview" Dashboard

Navigate to the **[CF Overview](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards#/view/maintained-by-perfx_cf-content-package_CF-Overview?_g=h@42b0d52&_a=h@1298c7d)** dashboard to analyze high-level performance metrics.

**What you'll see:**
The CF Overview dashboard displays key performance indicators (KPIs) for request and application logs across all your Cloud Foundry applications at a glance.

**Actions to perform:**

1. **Explore KPI metrics:**
   - Review response times and requests per second across applications on the left side called "Request Overview"
   - Analyze the Logs per Instance across various loggers and Log Levels on the right side called "Application Log Overview"

2. **Filter and analyze data:**
   - Click on any specific application name to filter data for that application
   - Use the **"Drill-down"** sections at the bottom of the dashboard alternatively

3. **Adjust time perspective:**
   - Change the time frame to **5 hours** to get a broader view of system performance over time
   - This provides a more holistic perspective on historical performance trends

4. **Drill down into log levels:**
   - Click on a specific log level (e.g., **info**) to examine:
     - Volume of log messages at that level
     - Which loggers are producing the messages

5. **Drill-up back to all components:**
   - Use the **pinned navigation** at the top of the dashboard
   - Remove or exclude pinned filter items to return to the complete component view

<br><img src="/exercises/ex2/images/02_02_0023.png" />
*Main click path to filter, slice and dice on the CF Overview dashboard*


#### Step 4. Review the other dashboards available within SAP Cloud Logging


<br><img src="/exercises/ex2/images/02_02_0024.png" />
*Other Navigation Options and Build-in Dashboards*

Cloud Logging provides an OpenSearch Dashboards interface which includes eight predefined dashboards that are automatically maintained and updated for you: **CF Overview** (general application request log and application log overview), **Top Apps** (Key performance indicators of all applications), **Four Golden Signals** (latency, traffic, errors, and saturation metrics), **Usage** (Request based application utilization and consumption patterns), **Performance and Quality** (application response), **History** (historical trends and trend analysis), "Requests and Logs" (detailed log analytics), and "App Crash Detection" (application failure monitoring). Users can switch between Cloud Foundry and Kyma (Kyma not relevant in this Hands-on-Session).

#### Exercise Summary
**Result**: CLS visualizes Key Performance Indicators of Requests Logs and Application Logs over time and provides analytical interface to assess overall application state along multiple dimensions.

**Background**:
SAP Cloud Logging is an OpenSearch-based observability service that centralizes log, metrics, and trace analysis across SAP BTP environments with pre-built monitoring dashboards.

**Further References**:
- https://help.sap.com/docs/cloud-logging
- https://discovery-center.cloud.sap/serviceCatalog/cloud-logging
- Explore more capabilities of the "Discover" tab in the [OpenSearch Dashboard](https://docs.opensearch.org/2.19/dashboards/discover/index-discover) documentation
- Understand different query options, pins and more with the [OpenSearch Dashboard Query Language](https://docs.opensearch.org/2.19/dashboards/dql/), [Query DSL
](https://docs.opensearch.org/2.19/query-dsl/) and [PPL](https://docs.opensearch.org/2.19/search-plugins/sql/ppl/index/).

## 2.3 SAP Cloud Logging - Log Analytics Interface

The log analytics capability of SAP Cloud Logging transforms raw operational data into actionable business intelligence through comprehensive search, analysis, and visualization of time-series information across distributed systems. This functionality enables organizations to proactively identify both known and emerging issues, accelerate root cause analysis, and optimize system performance through advanced correlation of logs, metrics, and traces with intelligent data management and enterprise-grade security controls.

**Learning Objective**: Upon completing these steps, you will be able to analyze request, application, and runtime logs of your BTP applications for performance monitoring, troubleshooting, and debugging purposes.

**Prerequisites**: Either complete the [previous exercise](#22-sap-cloud-logging---overall-system-state) or navigate directly to the ["Requests and Logs"](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Requests-and-Logs?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-2h,to:now))&_a=(description:'CF%20Analyze%20the%20overall%20set%20of%20logs%20and%20requests%20as%20well%20as%20their%20involved%20components%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Requests%20and%20Logs',viewMode:view)) dashboard in SAP Cloud Logging.

#### Step 1. Analyze the "Requests and Logs" dashboard

**What you'll see:**
- Three distinct panels for **Requests**, **Application Logs**, and **Runtime Logs**
- Filter controls in the top navigation bar
- TraceID, Log level, and Log types distribution charts in the **Details** panel on the right
- Real-time log entries with correlation capabilities across all three log types

**Actions to perform:**

1. **Examine the three-panel architecture:**
   - **Requests panel**: HTTP transactions with trace IDs, response times, and status codes
   - **Application Logs panel**: Business logic and custom application log entries
   - **Runtime Logs panel**: Platform-level container and deployment information

2. **Apply log level filtering:**
   - Locate the filter options built-in to the columns and rows of individual log tables
   - **Deselect all "debug" logs** to focus on higher-priority log levels
   - Observe how the **Application Logs** section updates to show only info, warn, and error level entries

3. **Analyze log distribution patterns:**
   - Review the **Levels** pie chart to understand log volume by severity
   - Note which log levels dominate your application's logging behavior

    <br><img src="/exercises/ex2/images/02_03_0020.png" />

*The Requests and Logs dashboard showing the three-panel structure with combined view of requests, application logs, and filtering capabilities*

#### Step 2. Investigate Runtime Logs for Deployment and Platform Events

**What you'll see:**
- Runtime logs containing deployment history, container lifecycle events, and platform operations
- **Drill Down** filtering options for instance-specific analysis
- Panel maximization controls for detailed examination

**Actions to perform:**

1. **Access runtime log details:**
   - Scroll down to the **Runtime Logs** panel at the bottom of the dashboard
   - Locate the **"Drill Down"** filtering options below the **Runtime Logs** section

2. **Filter by application instance:**
   - Use the **Filter** controls to filter on a specific instance (e.g., instance with Name **"0"**)
   - Observe how this isolates runtime events for a single application instance

    <br><img src="/exercises/ex2/images/02_03_0022.png" />
*The Runtime Logs panel showing drill-down filtering options to isolate specific application instances*

1. **Maximize the runtime logs view:**
   - Click the **three-dot context menu** in the top-right corner of the **Runtime Logs** panel
   - Select **"Maximize"** to expand the panel to full-screen view
   - Review deployment steps, container restarts, crashes, and other platform-level events

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_03_0023.png" />

*The maximized Runtime Logs panel providing detailed view of platform events and deployment history*
</details>

4. **Return to overview:**
   - Use the **three-dot context menu** again to **minimize** the panel
   - Return to the full **"Requests and Logs"** overview displaying all three panels

#### Step 3. Correlate Requests and Application Logs Using Trace ID

**What you'll see:**
- Request-to-application log correlation through shared trace identifiers
- Filtered view showing only logs related to a specific transaction

**Actions to perform:**

1. **Initiate trace-based correlation:**
   - Select a **trace_id** from either the **Requests** panel
   - Observe how both Request and Application log panels automatically filter to show only related entries

2. **Analyze the correlated transaction flow:**
   - Review the chronological sequence of log entries for the selected trace
   - Examine how the request flows through different application components
   - Note the **trace_id** filter now active in the top navigation

    <br><img src="/exercises/ex2/images/02_03_0024.png" />
*The dashboard filtered by trace_id showing correlated request and application logs for a single transaction flow*

#### Exercise Summary

**Result**: The log analytics interface provides comprehensive access to all log types with advanced filtering and correlation capabilities, enabling full-stack observability from HTTP requests through application logic to platform runtime events.

**Background**: 
SAP Cloud Logging is built on OpenSearch's distributed analytics engine, providing real-time indexing, full-text search, and advanced filtering capabilities to process large volumes of structured and unstructured log data from multiple sources across SAP BTP environments. The service supports W3C Trace Context and OpenTelemetry standards for distributed tracing correlation.

**Further References**: 
- [Access and Analyze Observability Data](https://help.sap.com/docs/cloud-logging/cloud-logging/access-and-analyze-observability-data)
- [OpenSearch Dashboards Documentation](https://docs.opensearch.org/2.19/dashboards/)
- [W3C Trace Context](https://www.w3.org/TR/trace-context/) and [OpenTelemetry](https://opentelemetry.io/) specifications

**Key Capabilities Demonstrated:**
- ✅ **Multi-tier Log Analysis**: Simultaneous view of requests, application, and runtime logs
- ✅ **Dynamic Filtering**: Real-time filtering by log levels, instances, and trace identifiers
- ✅ **Distributed Tracing**: End-to-end request correlation across application boundaries
- ✅ **Platform Monitoring**: Runtime log analysis for deployment and infrastructure events


## 2.4 SAP Cloud Logging - Distributed System Monitoring - Four Golden Signals

Distributed System Monitoring of SAP Cloud Logging helps DevOps teams proactively oversee system performance and reliability by offering thorough visibility into how external requests affect the system. This feature aids in making key business choices about error handling, system scaling, and resource management through detailed analysis of performance metrics and smart prioritization of important workloads.

**Learning Objectives**: After completing these steps you will know how to:
- Navigate and interpret the Four Golden Signals dashboard in SAP Cloud Logging
- Perform time-based drill-down analysis on latency metrics
- Monitor traffic patterns and request volume indicators
- Analyze error rates and HTTP status code distributions
- Review Cloud Foundry container metrics for resource utilization

**Prerequisites**: Either complete the [previous exercise](#22-sap-cloud-logging---overall-system-state) or navigate directly to the ["Four Golden Signals"](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Four-Golden-Signals?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Quickly%20gauge%20the%20state%20of%20your%20applications%20and%20spot%20possible%20issues%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Four%20Golden%20Signals',viewMode:view)) dashboard in SAP Cloud Logging.

---

#### Step 1. Navigate and explore the Four Golden Signals dashboard overview

**What you'll see:**
- The main Four Golden Signals dashboard with four distinct panels representing Latency, Traffic, Errors, and Saturation
- Time series charts showing metrics over the selected time range (default: last 5 hours)
- Navigation tabs for **All Signals**, **Latency**, **Traffic**, **Errors**, **Saturation**, and **Container Metrics**
- Interactive visualization elements with drill-down capabilities

**Actions to perform:**

1. **Explore dashboard panels:**
   - Review the **Latency** panel showing response time metrics with percentile-based buckets (P50, P75, P90, P95, P99)
   - Examine the **Traffic** panel displaying requests per second and network throughput
   - Analyze the **Errors** panel showing HTTP status code distributions (4xx client errors, 5xx server errors)
   - Note the **Saturation** panel (currently being enhanced, excluded from this workshop)

2. **Perform time-based drill-down:**
   - Use your mouse to click and drag a rectangle over an interesting time period in the **Latency of successful requests** chart
   - This creates a time filter to focus on that specific timeframe for detailed analysis

    <br><img src="/exercises/ex2/images/02_04_0020.png" />
*The Four Golden Signals Dashboard showing all signal panels with comprehensive metrics overview*

3. **Reset time range to broader view:**
   - Click on the **Start Date** field in the top-right corner
   - Select **Relative** from the dropdown
   - Set the value to **5** **hours**
   - Click on **End Date**, select **Now**, then click **Set end date and time to now**

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_04_0021.png" />

*Time range configuration interface showing relative time selection for 5 hours from now*
</details>

4. **Navigate to Latency dashboard:**
   - Click on the **[Latency](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Latency?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Use%20the%20Latency%20dashboard%20to%20investigate%20the%20latency%20of%20your%20system%20and%20applications.%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Latency',viewMode:view))** tab in the navigation menu to perform Step 2


#### Step 2. Analyze latency metrics and perform detailed trend analysis

**What you'll see:**
- Detailed latency dashboard with percentile-based response time buckets (P50, P75, P90, P95, P99)
- Total request count for the selected timeframe
- Interactive time series chart with selectable time windows
- Drill-down tables showing individual request details with correlation IDs, response status, and request endpoints

**Actions to perform:**

1. **Navigate to Latency dashboard:**
   - Click on the **[Latency](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Latency?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Use%20the%20Latency%20dashboard%20to%20investigate%20the%20latency%20of%20your%20system%20and%20applications.%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Latency',viewMode:view))** tab in the dashboard navigation

2. **Perform latency analysis:**
   - Use your mouse to select a time window with higher response times by dragging a rectangle over peaks in the chart
   - Scroll down to examine the detailed request table showing:
     - **Correlation IDs** for request tracing
     - **Response status codes** (HTTP status)
     - **Request endpoints** and methods
     - **Actual response times** for individual requests

<br><img src="/exercises/ex2/images/02_04_0022.png" />
*Latency dashboard showing percentile buckets and detailed drill-down capabilities with request-level details*

3. **Reset filters and time range:**
   - Click on **Start Date** in the top-right corner
   - Change to **Relative** and set to **5** **hours**
   - Click **End Date**, select **Now**, then **Set end date and time to now**
   - Remove the response_time filter by clicking the **Delete** option from the filter context menu

<details>
    <summary>📷💡 View screenshot for this step</summary>
    <br><img src="/exercises/ex2/images/02_04_0023.png" />

*Filter management interface showing how to remove time range selections and reset dashboard view*
</details>

4. **Navigate to Traffic dashboard:**
   - Click on the **[Traffic](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Traffic?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'CF%20Four%20Golden%20Signals%20-%20Traffic%20Focus%20View%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Traffic',viewMode:view))** tab in the navigation menu

#### Step 3. Monitor traffic volume and payload indicators

**What you'll see:**
- Request count metrics per status code over time
- Request payload distribution showing component names, targets, and response sizes
- Incoming and outgoing traffic panels with bandwidth utilization
- Count distribution charts for request and response sizes
- Network traffic metrics in bytes per second

**Actions to perform:**

1. **Navigate to the [Traffic](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Traffic?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'CF%20Four%20Golden%20Signals%20-%20Traffic%20Focus%20View%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Traffic',viewMode:view)) dashboard and explore the metrics:**
   - Analyze the **Request counts per status code** chart showing traffic patterns by HTTP response codes
   - Examine the **Request Payload Distribution** table displaying:
     - **Component Name** (application/service names)
     - **Target** endpoints being accessed
     - **Count** of requests per endpoint
     - **Total response size** metrics

2. **Analyze traffic patterns:**
   - Review **Incoming Traffic** panel showing request volume and size distributions
   - Monitor **Outgoing Traffic** panel displaying response patterns and bandwidth usage
   - Examine **Count of request sizes** and **Count of response sizes** histograms

<br><img src="/exercises/ex2/images/02_04_0024.png" />
*Traffic dashboard displaying comprehensive request/response metrics and payload distribution analysis*

3. **Navigate to Errors dashboard:**
   - Click on the **[Errors](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Errors?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'CF%20Four%20Golden%20Signals%20-%20Error%20Focus%20View%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Errors',viewMode:view))** tab in the navigation menu to continue to Step 4.

#### Step 4. Examine error rate monitoring and status code analysis

**What you'll see:**
- HTTP status code distribution charts (4xx client errors, 5xx server errors)
- Error rate percentages and trends over time
- Application log error messages and details
- Filterable error data for detailed investigation

**Actions to perform:**

1. **Navigate to **Errors** dashboard:**
   - Click on the **[Errors](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_cf-content-package_CF-Errors?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'CF%20Four%20Golden%20Signals%20-%20Error%20Focus%20View%20%5Bmaintained%20by%20SAP%5D',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'CF%20Errors',viewMode:view))** tab in the dashboard navigation

2. **Analyze error patterns:**
   - Review **Status Code 4XX**, **Status Code 5XX**, and **Status Code >599** distributions
   - Monitor error rate trends and identify peak error periods
   - Examine error message details in the lower panel for root cause analysis

3. **Apply optional filtering:**
   - Use the learned filter functions to slice and dice error data by:
     - Time ranges for specific incident periods
     - Application components experiencing errors
     - Specific HTTP status codes for targeted analysis

<br><img src="/exercises/ex2/images/02_04_0025.png" />
*Errors dashboard showing HTTP status code distributions and detailed error message analysis*

1. **Navigate to Container Metrics dashboard:**
   - Click on the **[Container Metrics](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_otel-content-package_OTel-CF-Container-Metrics?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Explore%20container%20metrics%20emitted%20by%20the%20CloudFoundry%20runtime%20environment.',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'%5BOTel%5D%20%5BCF%5D%20Container%20Metrics',viewMode:view))** tab in the navigation menu


#### Step 5. Review container metrics and resource utilization

**What you'll see:**
- Three primary Cloud Foundry container metric panels: CPU, Memory, and Filesystem utilization
- Time-based resource consumption trends
- Instance-level and application-level resource breakdowns
- Interactive filtering options for specific applications and instances

**Actions to perform:**

1. **Navigate to Container Metrics:**
   - Click on the **[Container Metrics](https://dashboards-sf-e1bf1f9f-be6a-4a59-9980-0918531dd856.cls-17.cloud.logs.services.eu10.hana.ondemand.com/app/dashboards?security_tenant=global#/view/maintained-by-perfx_otel-content-package_OTel-CF-Container-Metrics?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-5h,to:now))&_a=(description:'Explore%20container%20metrics%20emitted%20by%20the%20CloudFoundry%20runtime%20environment.',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!f),query:(language:kuery,query:''),timeRestore:!f,title:'%5BOTel%5D%20%5BCF%5D%20Container%20Metrics',viewMode:view))** tab in the dashboard navigation

2. **Analyze resource utilization:**
   - Review **CPU utilization** patterns across application instances
   - Monitor **Memory consumption** trends and identify potential memory leaks
   - Examine **Filesystem usage** for storage-related issues

3. **Apply resource filtering:**
   - Use time-based filtering to correlate resource usage with performance issues
   - Filter by specific **application instances** for targeted analysis
   - Cross-reference with latency and error data for comprehensive troubleshooting

<br><img src="/exercises/ex2/images/02_04_0026.png" />
*Container metrics dashboard displaying CPU, Memory, and Filesystem utilization across Cloud Foundry instances*



#### Exercise Summary

**Technical Benefits & Key Capabilities Demonstrated:**
- ✅ **Proactive monitoring** through comprehensive visibility into distributed system performance
- ✅ **Root cause analysis** capabilities with drill-down from high-level metrics to individual requests
- ✅ **Business decision support** for scaling, error handling, and resource allocation
- ✅ **SRE best practices** implementation following Google's Four Golden Signals framework

**Result**: You have successfully explored all Four Golden Signals with current load data and trending information, demonstrating comprehensive distributed system monitoring capabilities in SAP Cloud Logging.

**Background**:
SAP Cloud Logging's Distributed System Monitoring enables DevOps teams to proactively oversee system performance and reliability by providing comprehensive visibility into how external requests impact the system through Google SRE's Four Golden Signals framework. The Four Golden Signals—latency (response time), traffic (request volume), errors (failure rate), and saturation (resource utilization)—represent the core metrics that indicate system health and performance in distributed environments. SAP Cloud Logging leverages OpenSearch's analytics capabilities to collect, process, and visualize these critical signals, enabling teams to make informed business decisions about error handling, system scaling, and resource management through detailed performance analysis and intelligent workload prioritization.

**Further References**:
- [Google SRE Book - Monitoring Distributed Systems](https://sre.google/sre-book/monitoring-distributed-systems/#xref_monitoring_golden-signals)
- [Cloud Foundry Container Metrics Documentation](https://docs.cloudfoundry.org/running/all_metrics.html)
- [SAP Cloud Logging Service Documentation](https://help.sap.com/docs/cloud-logging)

## Summary

Your observability game is now strong—you can spot issues before they become problems. But here's the critical question that will make or break your launch: What happens when your perfectly monitored system gets hit with 10x the expected traffic?

The Reality: Great monitoring means nothing if your application crashes under load. Exercise 3 puts your system through the ultimate stress test using SAP BTP's Application Autoscaler, proving it can automatically scale when success strikes.

*Ready to ensure your system can handle its own success? Time for the final validation. Continue to - [Exercise 3 - Performance Under Fire](../ex3/README.md)*
