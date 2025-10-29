#!/usr/bin/env bash

set -euo pipefail

: "${CF_USER_NAME:?Environment variable CF_USER_NAME is not set or empty}"
: "${CF_USER_PASSWORD:?Environment variable CF_USER_PASSWORD is not set or empty}"

 cf login -u "$CF_USER_NAME" -p "$CF_USER_PASSWORD" \
  -a https://api.cf.eu10-004.hana.ondemand.com  \
  --origin a8z641mqa-platform

XP265_CLIENT_ID=$(cf curl "/v3/apps/d1fbbec7-6739-49db-a815-33927ad3b0ea/env" | jq -r ".system_env_json.VCAP_SERVICES.xsuaa[0].credentials.clientid")
XP265_CLIENT_SECRET=$(cf curl "/v3/apps/d1fbbec7-6739-49db-a815-33927ad3b0ea/env" | jq -r ".system_env_json.VCAP_SERVICES.xsuaa[0].credentials.clientsecret")

XP265_CLIENT_ID=$XP265_CLIENT_ID XP265_CLIENT_SECRET=$XP265_CLIENT_SECRET ./exercises/ex3/instructors-tasks/2.put-load-on-autoscaler.sh "$@"
