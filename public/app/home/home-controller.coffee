class HomeController
  constructor: (SITE_CONFIG) ->
    @SITE_CONFIG = SITE_CONFIG
  getSiteTitle: =>
    @SITE_CONFIG.name

angular.module('main').controller 'HomeController', HomeController