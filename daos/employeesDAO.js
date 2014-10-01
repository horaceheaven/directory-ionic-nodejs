var MongoClient = require('mongodb').MongoClient
    , format = require('util').format
    , q = require('q');

var mongoDBName = process.env["MONGO_DB_NAME"] || "test_db";
var mongoDBUrl = process.env["MONGO_DB_URL"] || "mongodb://54.205.85.64";
var mongoDBPort = process.env["MONGO_DB_PORT"] || "27017";

console.log("Mongo DB Name: " + mongoDBName);
console.log("Mongo DB URL: " + mongoDBUrl);
console.log("Mongo DB Port: " + mongoDBPort);

if( mongoDBName && mongoDBUrl && mongoDBPort ){
	connString = mongoDBUrl +':'+ mongoDBPort +'/' + mongoDBName;
  console.log("Connection string: " + connString);
}

var EmployeeDAO = (function(client, connString, q, collectionName){
	var db, connect, getById, getAll, getManagees;
	collection = function(collectionName){
		var defered = q.defer();
		MongoClient.connect(connString, function(err, db) {
	 		if(err){
        console.log("failed to connect to mongodb");
	 			defered.reject(err);
	 		}

	 		defered.resolve(db.collection(collectionName));
		});

		return defered.promise;
	};


	findById = function(id, collection){
		var defered = q.defer();
			collection('employees')
				.then(function(employeeCollection){
					employeeCollection.findOne({'id': id}, function(err, employee){
						if(err){
							console.log(err);
							defered.reject(err);
						}
						defered.resolve(employee);
					});

				});

		return defered.promise;
	}

	var findAll = function(collection){
		var defered = q.defer();
		collection('employees')
			.then(function(employeeCollection){
				employeeCollection.find({}).toArray(function(err, employees){
					if(err){
						defered.reject(err);
					}

					defered.resolve(employees);
				});
			}).done();
		return defered.promise;
	};

	var findManagees = function(managerId, collection){
		var defered = q.defer();

		collection('employees')
			.then(function(employeeCollection){
				employeeCollection.find({managerId: managerId})
					.toArray(function(err, managees){
						if(err){
							defered.reject(err);
						}
						defered.resolve(managees);
					});
			}).done();
		return defered.promise;
	};

	return {	findById :  findById,
				collection : collection,
				findAll : findAll,
				findManagees : findManagees};


})(MongoClient, connString, q, "employees");

exports.employees = EmployeeDAO;
