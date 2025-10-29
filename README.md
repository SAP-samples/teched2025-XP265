# XP265 - Mastering Cloud-Native Applications on SAP BTP, Cloud Foundry Runtime

## Description

This repository contains the material for the SAP TechEd 2025 session called XP265 - Mastering cloud-native applications on SAP BTP, Cloud Foundry runtime.

## Overview

Learn how to deploy and operate reliable applications on the Cloud Foundry runtime for SAP BTP.

Get hands-on with proven best practices for running production workloads on SAP BTP, Cloud Foundry runtime. This session covers key aspects of Day-2 operations such as observability with SAP Cloud Logging and SAP Cloud ALM, proper sizing, and safe deployment strategies using SAP Continuous Integration and Delivery pipelines. Learn how SAP teams monitor distributed systems, ensure high availability, and handle operational challenges in real-world scenarios. Walk away with actionable insights to make your apps production-ready and resilient at scale.

This repository accompanies the SAP TechEd 2025 session XP265 and provides the guided exercises for participants.

Find below a scenario description and links to all exercise material.

## Introduction and Scenario Overview

**You're 48 hours from go-live. Is your system ready?**

As a DevOps engineer facing a critical production launch, you'll navigate real-world operational challenges using SAP BTP's platform operations and observability stack. This hands-on workshop puts you in the hot seat of qualifying a cloud-native incident management application for public release.

**The Challenge:**
Your team's NodeJS-based application (built with SAP CAP) is feature-complete and deployed to SAP BTP Cloud Foundry. The system leverages 12-factor development patterns and integrates with your SAP S/4HANA landscape through BTP extension scenarios. But with executive stakeholders watching and end-users waiting, one question remains: *Can your system handle production load without becoming the next incident itself?*

**Your Mission:**
Transform from deployment to operational excellence by mastering production-grade monitoring, troubleshooting, and scaling techniques. You'll work with a realistic microservices architecture including the core incident management service and feedback microservice. See the complete [architecture diagram](/exercises/ex0/README.md#scenario-description-and-system-landscape) and optionally explore the [application end-user interface](/exercises/ex0/README.md#start-here-to-understand-your-target-application) yourself, if you want to understand the background (optional content).

**What You'll Champion:**

- (Optional) **[Getting Started](/exercises/ex0/README.md): General Information and Prerequisites** - Start at the SAP Business Technology Platform and get a brief overview of the application that this exercise is about.
- **[Exercise 1](/exercises/ex1/README.md): Production Readiness Check** - Execute comprehensive platform health checks, validate sizing, and verify observability toolchain integration as covered.
- **[Exercise 2](/exercises/ex2/README.md): Operational Intelligence** - Leverage SAP Cloud ALM's Central Observability and Cloud Logging's Local Observability analytics to decode system behavior and analyze application performance. 
- **[Exercise 3](/exercises/ex3/README.md): Performance Under Fire** - Watch the synthetic load scenario and verify auto-scaling responses under peak load conditions. 

**The Outcome:**
Walk away with confidence to approve production releases, armed with practical skills in cloud-native operations using SAP Cloud ALM, SAP Cloud Logging, and OpenTelemetry that directly apply to your enterprise SAP landscape.

*Ready to prove your system is launch-worthy? Let's dive in.*


## Exercises

- [Getting Started - General Information and Prerequisites (Optional)](exercises/ex0/)
    - [Scenario Description And System Landscape](exercises/ex0#scenario-description-and-system-landscape)
    - [Start here and get access to the Backend System and BTP Cockpit](exercises/ex0#start-here-and-get-access-to-the-backend-system-and-btp-cockpit)
    - [Start here to understand your target application](exercises/ex0#start-here-to-understand-your-target-application)
    - [Summary](exercises/ex0#summary)
- [Exercise 1 - Production Readiness Checks](exercises/ex1/)
    - [Exercise 1 - Production Readiness Checks](exercises/ex1#exercise-1---production-readiness-checks)
    - [1.1 Check: Basic Platform Monitoring and Log Validation](exercises/ex1#11-check-basic-platform-monitoring-and-log-validation)
    - [1.2 Check: Instance Sizing Validation](exercises/ex1#12-check-instance-sizing-validation)
    - [1.3 Check: Observability Tool Validation - SAP Cloud Logging and SAP Cloud ALM Connection Validation](exercises/ex1#13-check-observability-tool-validation---sap-cloud-logging-and-sap-cloud-alm-connection-validation)
    - [1.4 Check: Automated Delivery](exercises/ex1#14-check-automated-delivery)
    - [Summary](exercises/ex1#summary)
- [Exercise 2 - Observability](exercises/ex2/)
    - [2.1 SAP Cloud ALM - Central Observability with Real User Monitoring](exercises/ex2#21-sap-cloud-alm---central-observability-with-real-user-monitoring)
    - [2.2 SAP Cloud Logging - Overall System State](exercises/ex2#22-sap-cloud-logging---overall-system-state)
    - [2.3 SAP Cloud Logging - Log Analytics Interface](exercises/ex2#23-sap-cloud-logging---log-analytics-interface)
    - [2.4 SAP Cloud Logging - Distributed System Monitoring - Four Golden Signals](exercises/ex2#24-sap-cloud-logging---distributed-system-monitoring---four-golden-signals)
    - [Summary](exercises/ex2#summary)
- [Exercise 3 - Application Scaling ](exercises/ex3/)
    - [Exercise Background](exercises/ex3#exercise-background)
    - [3.1 Check Application Status](exercises/ex3#31-check-application-status)
    - [3.2 Verify the Application Scaling Policy](exercises/ex3#32-verify-the-application-scaling-policy)
    - [3.3 Simulate Traffic Spike](exercises/ex3#33-simulate-traffic-spike)
    - [3.4 Verify Application Scaling](exercises/ex3#34-verify-application-scaling)
    - [3.5 Cleanup](exercises/ex3#35-cleanup)

## Prerequisites

To complete the exercises in this repository, make sure you meet the following prerequisites:

 - Students enrolled in SAP TechEd 2025 event are already provided with the BTP account along with their credentials.
 - This experience is a hosted scenario only available fully during TechEd 2025 as part of the on site experience of Hands on Session XP265.
  
  Environment Details:
   - [SAP BTP Cockpit](https://emea.cockpit.btp.cloud.sap/cockpit?idp=a8z641mqa.accounts.ondemand.com#/globalaccount/9e10042e-0fbd-42ed-8cbf-2905b95c6d99/accountModel&//?section=SubaccountsSection&view=TilesView)
   - Subaccount: `XP265_SHARED`
   - Org: `XP265_ORG`
   - Space: `XP265`
   - User ID & Password: `Provided during the event`



## Contributing
Please read the [CONTRIBUTING.md](./CONTRIBUTING.md) to understand the contribution guidelines.

## Code of Conduct
Please read the [SAP Open Source Code of Conduct](https://github.com/SAP-samples/.github/blob/main/CODE_OF_CONDUCT.md).

## How to obtain support

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License
Copyright (c) 2025 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
