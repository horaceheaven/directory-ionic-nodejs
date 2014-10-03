angular.module('directory.services', ['ngResource'])

    .factory('Employees', function ($resource) {
        return $resource('/master/employees/:employeeId/:data');
    });
