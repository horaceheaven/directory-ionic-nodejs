angular.module('directory.services', ['ngResource'])

    .factory('Employees', function ($resource, $location) {
        var branch = $location.path().split("/")[1];
        return $resource( '/' + branch + '/employees/:employeeId/:data');
    });