angular.module('directory.services', ['ngResource'])

    .factory('Employees', function ($resource) {
        return $resource('/latest/employees/:employeeId/:data');
    });
