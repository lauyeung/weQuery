App.VotesNewController = Ember.ObjectController.extend({

  actions: {
    vote: function(){
      var self = this;

      return this.get('model').get('content').save().then(function(response){
        self.store.push('vote', response.get('data'));
      }, function(response){
        console.log('No vote');
      });
    }
  }

});
