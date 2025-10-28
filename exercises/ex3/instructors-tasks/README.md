# Instructor Tasks for Exercise 3

The following tasks are intended for lab instructors to facilitate the exercise on application scaling.

Steps:

1. Login to CF and extract required credentials
   
    - Provide the environment variables <CF_USER_NAME> and <CF_USER_PASSWORD> and Use the command:
      ```bash
      CF_USER_NAME=<REPLACE_WITH_CF_USER_NAME> CF_USER_PASSWORD=<REPLACE_WITH_CF_USER_PASSWORD> \
      exercises/ex3/instructors-tasks/1.cf-login-extract-creds.sh
      
The script will log in to CF, extract necessary credentials and apply load on the application

>Note: There is another standalone script `2.put-load-on-autoscaler.sh` that can be used to apply load on the application separately if needed.
      
      
