describe 'HomeController', ->
  beforeEach ->
    module 'main'
    
    inject ($controller, $rootScope) =>
      @rootScope = $rootScope
      @sut = $controller 'HomeController',
        SITE_CONFIG: name: 'frenchtoast'

  describe '->getSiteTitle', ->
    beforeEach ->
      @result = @sut.getSiteTitle()

    it 'should return the site title', ->
      expect(@result).to.equal 'frenchtoast'
