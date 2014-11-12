var MongoClient = require('mongodb').MongoClient
    , format = require('util').format
    , q = require('q')
    , loggly = require('loggly')
    , client;

client = loggly.createClient({
    token: "2a4829c3-7c6e-4c78-a655-c62b26c68966",
    subdomain: "sigtest",
    tags: ['NodeJS'],
    json:true
});

var mongoDBName = process.env["MONGO_DB_NAME"] || "test_db";
var mongoDBUrl = process.env["MONGO_DB_URL"] || "mongodb://10.188.154.61";
var mongoDBPort = process.env["MONGO_DB_PORT"] || "27017";

client.log(	"DB Name: " + mongoDBName +
			" Connection String: " + mongoDBUrl +
			" Port: " + mongoDBPort
);



if( mongoDBName && mongoDBUrl && mongoDBPort ){
	connString = mongoDBUrl +':'+ mongoDBPort +'/' + mongoDBName;
}

var EmployeeDAO = (function(client, connString, q, collectionName){
	var db, connect, getById, getAll, getManagees;
	collection = function(collectionName){
		var defered = q.defer();
		MongoClient.connect(connString, function(err, db) {
	 		if(err){
	 			client.log(err);
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
							client.log(err);
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
						client.log(err);
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
							client.log(err);
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
