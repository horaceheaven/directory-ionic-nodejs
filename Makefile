REPORTER=xunit
unit-test:
	@mocha --reporter xunit test/employeesSpec.js > unit-report.xml

integration-test:
	@mocha --reporter xunit test/employeesIntegrationSpec.js > integration-report.xml

.PHONY: unit-test integration-test
