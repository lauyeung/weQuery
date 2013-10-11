App.Question = DS.Model.extend({

  state: DS.attr(),
  body: DS.attr(),
  votes: DS.hasMany('vote')


});
