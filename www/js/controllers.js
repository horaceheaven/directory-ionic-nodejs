angular.module('directory.controllers', [])

    .controller('EmployeeListCtrl', function ($scope, Employees, $log) {

        $scope.searchKey = "";

        $scope.clearSearch = function () {
            $scope.searchKey = "";
            $scope.employees = Employees.query();
        }

        $scope.search = function () {
            $scope.employees = Employees.query({name: $scope.searchKey});
        }

        $scope.employees = Employees.query(function(data) {
            // success handler
        }, function(error) {
            console.log(error);
        });

        $log.info('Employee list requested');
    })

    .controller('EmployeeDetailCtrl', function($scope, $stateParams, Employees, $location, $log) {
        var branch;
        console.log('details');
        branch = $location.absUrl().split("/")[3];
        $scope.branch = branch;
        $scope.employee = Employees.get({employeeId: $stateParams.employeeId});
        $log.info('Employee ' + $stateParams.employeeId +' details requested');
    })

    .controller('EmployeeReportsCtrl', function ($scope, $stateParams, Employees, $log) {
        console.log('reports');
        $scope.employee = Employees.get({employeeId: $stateParams.employeeId, data: 'reports'});
        $log.info('Employee ' + $stateParams.employeeId +' report generated');
    });
