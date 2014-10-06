angular.module('directory.services', ['ngResource'])

    .factory('Employees', function ($resource) {
        return $resource('/:qa/employees/:employeeId/:data');
    });
