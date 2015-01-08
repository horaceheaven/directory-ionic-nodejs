REPORTER=xunit
WORKSPACE=.
unit-test:
	@mocha --reporter xunit $(WORKSPACE)/test/employeesSpec.js > unit-report.xml

integration-test:
	@mocha --reporter xunit $(WORKSPACE)/test/employeesIntegrationSpec.js > integration-report.xml

.PHONY: unit-test integration-test
