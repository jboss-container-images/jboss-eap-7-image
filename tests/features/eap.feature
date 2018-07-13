@jboss-eap-7/eap72
Feature: Standalone common EAP tests

  Scenario: Check that dotfiles are properly extracted to $JBOSS_HOME (CLOUD-31)
    When container is ready
    Then run sh -c 'test -d $JBOSS_HOME/.installation && echo all good' in container and check its output for all good

  Scenario: Check that deployment labels are correctly set and linked to proper directories
    When container is ready
    Then the image should contain label com.redhat.deployments-dir with value /opt/eap/standalone/deployments
     And the image should contain label com.redhat.dev-mode with value DEBUG:true
     And the image should contain label com.redhat.dev-mode.port with value DEBUG_PORT:8787
     And file /opt/eap/standalone/deployments should exist and be a directory
     And file /opt/eap/standalone/deployments/README.txt should exist

  @ci
  Scenario: Check that the EAP images contains 5 layers
    Given image is built
     Then image should contain 5 layers

  # https://issues.jboss.org/browse/CLOUD-243
  Scenario: Check debug port is available
    When container is started with env
     | variable | value |
     | DEBUG    | true  |
    Then check that port 8787 is open

  # https://issues.jboss.org/browse/CLOUD-243
  Scenario: Check custom debug port is available
    When container is started with env
     | variable   | value |
     | DEBUG      | true  |
     | DEBUG_PORT | 8798  |
    Then check that port 8798 is open

