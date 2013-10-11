App.QuestionsNewController = Ember.ObjectController.extend({

  actions: {
    save: function(){
      var self = this;
      return this.get('content').save().then(function(response){
        self.store.push('question', response.get('data'));
        return self.transitionToRoute('questions.success');
      }, function(response){
        console.log('Oh noooooo');
      });
    }
  }

});
