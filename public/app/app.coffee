angular
.module('main', ['ui.bootstrap', 'ngRoute'])
.config ($routeProvider, $locationProvider) =>
  $locationProvider.html5Mode
    enabled: true
    requireBase: false
    
  $routeProvider
    .when '/',
      templateUrl: 'app/home/home.html'
      controller: 'HomeController'
      controllerAs: 'controller'
    .otherwise redirectTo: '/'

.run ($rootScope, SITE_CONFIG) =>
  $rootScope.global = {} 
  $rootScope.global.app = SITE_CONFIG