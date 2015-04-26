angular.module('main', ['ui.router']);

window.expect = chai.expect;

beforeEach ->
  module 'main', ($provide) =>
    $provide.value 'SITE_CONFIG', {}
    return
