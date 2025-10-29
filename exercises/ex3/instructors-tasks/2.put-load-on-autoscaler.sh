#!/usr/bin/env bash
set -euo pipefail

# This script puts load on an endpoint to trigger autoscaling

# Require env
: "${XP265_CLIENT_ID:?Environment variable XP265_CLIENT_ID is not set or empty}"
: "${XP265_CLIENT_SECRET:?Environment variable XP265_CLIENT_SECRET is not set or empty}"

AUTH_URL="https://xp265-shared-4t2shozq.authentication.eu10.hana.ondemand.com/oauth/token"
TARGET_URL="https://xp265-shared-xp265-incident-management-srv.cfapps.eu10-004.hana.ondemand.com/odata/v4/processor/Incidents"

# Duration, default 10m, allow override via first arg
MINUTES="${1:-10m}"
REQUESTS_PER_SECOND=${2:-500}

echo "Obtaining OAuth token..."
# Prefer Basic Auth, avoid putting secrets into the form body
TOKEN="$(curl -sSf \
  -u "${XP265_CLIENT_ID}:${XP265_CLIENT_SECRET}" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data 'grant_type=client_credentials' \
  "${AUTH_URL}" | jq -r '.access_token')"

if [[ -z "${TOKEN}" || "${TOKEN}" == "null" ]]; then
  echo "Failed to obtain OAuth token, exiting" >&2
  exit 1
fi
echo "OAuth token obtained"

echo "Starting load test for ${MINUTES} with ${REQUESTS_PER_SECOND} r/s ..."
echo "Press Enter to continue..."
read

oha -z "${MINUTES}" -q "${REQUESTS_PER_SECOND}" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  "${TARGET_URL}"

echo "Load test completed"
