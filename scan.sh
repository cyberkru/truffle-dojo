#!/bin/bash

trufflehog --json --regex --entropy=False file:///proj > report.json
echo report.json
