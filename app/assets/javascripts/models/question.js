App.Question = DS.Model.extend({

  state: DS.attr(),
  content: DS.attr(),
  votes: DS.hasMany('vote'),

  capitalContent: function(){
    return this.get('state').capitalize();
  }.property('state')

});
