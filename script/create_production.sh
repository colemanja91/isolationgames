#!/bin/bash

eb create isolationgames-production \
  --instance-types m5.large \
  --min-instances 1 \
  --max-instances 2 \
  --elb-type application 
