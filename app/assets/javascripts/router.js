// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('questions', function(){
    this.route('new', {path: '/'});
    this.route('success', {path: '/success'});
  });
});
