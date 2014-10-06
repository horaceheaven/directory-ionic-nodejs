angular.module('directory.services', ['ngResource'])
    .factory('Employees', function ($resource, $location) {
        var branch = $location.absUrl().split("/")[2];
        return $resource( '/' + branch + '/employees/:employeeId/:data');
    });
