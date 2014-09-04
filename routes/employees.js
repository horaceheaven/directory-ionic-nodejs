var employeeData = require('../daos/employeesDAO.js').employees;

exports.api = {};

exports.findAll = function(req, res, next){
    var name = req.query.name;
    employeeData.findAll(employeeData.collection)
        .then(function(employees){
            if (name) {
                res.send(employees.filter(function(employee) {
                    return (employee.firstName + ' ' + employee.lastName).toLowerCase().indexOf(name.toLowerCase()) > -1;
                }));
            } else {
                console.log(employees);
                res.send(employees);
            }
        });
}

exports.findById = function(req, res, next){
     var id = parseInt(req.params.id);

     employeeData.findById(id, employeeData.collection)
        .then(function(employee){
            res.send(employee);
        });
}

exports.findReports = function(req, res, next){
     var id = parseInt(req.params.id), response, reports=[];

     employeeData.findById(id, employeeData.collection)
        .then(function(employee){
            response = {
                id: id,
                firstName: employee.firstName,
                lastName: employee.lastName,
                title: employee.title,
                pic: employee.pic
            }
            
            employeeData.findManagees(id, employeeData.collection)
                .then(function(employees){
                   for (var i=0; i<employees.length; i++) {
                        employee = employees[i];
                        reports.push({id: employee.id, firstName: employee.firstName, lastName: employee.lastName, title: employee.title, pic: employee.pic});     
                    }
                    response.reports = reports;
                    res.send(response);
                });


        })

}
