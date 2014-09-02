var request = require('supertest')
  , express = require('express');

var app = require('../server.js').app;


describe('GET /api/employees/1', function(){
  it('respond with json', function(done){
    request(app)
      .get('/api/employees/1/reports')
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200)
      .expect({"id":1,"firstName":"Julie","lastName":"Taylor","title":"VP of Marketing","pic":"Julie_Taylor.jpg","reports":[{"id":7,"firstName":"Lisa","lastName":"Wong","title":"Marketing Manager","pic":"Lisa_Wong.jpg"},{"id":8,"firstName":"Gary","lastName":"Donovan","title":"Marketing Manager","pic":"Gary_Donovan.jpg"}]},done);
  })
})