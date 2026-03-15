#!/bin/sh
set -e

DIR=$1
MIN_COV=$2

if [ -z "$DIR" ] || [ -z "$MIN_COV" ]; then
    echo "Usage: run_coverage <dir> <min_coverage>"
    exit 1
fi

cd "$DIR"
echo "Running tests in $DIR with coverage..."

# We don't fail immediately on test failure because we still want to output
go test -coverprofile=coverage.out ./... || test_failed=1

if [ ! -f coverage.out ]; then
    echo "No coverage data found."
    exit 1
fi

TOTAL=$(go tool cover -func=coverage.out | awk '/total:/ {print substr($3, 1, length($3)-1)}')
echo "Actual Coverage: ${TOTAL}%"
echo "Target Coverage: ${MIN_COV}%"

# Fail if test failed regardless of coverage
if [ "$test_failed" = "1" ]; then
    echo "FAIL: go test returned errors."
    exit 1
fi

# Compare float strings using awk
awk -v t="$TOTAL" -v m="$MIN_COV" 'BEGIN { 
    if (t < m) { 
        print "FAIL: Coverage is below minimum target of " m "%"; 
        exit 1 
    } else { 
        print "PASS: Coverage meets or exceeds minimum target of " m "%"; 
        exit 0 
    } 
}'
