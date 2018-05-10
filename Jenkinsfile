#!/usr/bin/env groovy

@Library('shared-library@1.3.0') _

if (env.BRANCH_NAME =~ /release-\d+/) {
  k8sNodeCD {
    deployTo = "test"
    chart = "helloworld"
  }
} else if (env.BRANCH_NAME =~ /master/ || env.BRANCH_NAME =~ /PR-\d+/) {
  k8sNodeCI {
    deployTo = "dev"
    chart = "helloworld"
  }
}
