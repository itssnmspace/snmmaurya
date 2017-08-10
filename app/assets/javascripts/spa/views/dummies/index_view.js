Spa.Views.DummiesIndexView = Backbone.View.extend({
  el: '#body',

  template: JST["spa/templates/dummies/index_view_template"],

  events: {
  },

  initialize: function(){
    dummiesIndexViewObject = this;
    _.bindAll(this, 'render', 'addAll', 'addOne');
    this.render();
    this.addAll();
  },

  render: function(){
    this.$el.find('#dummies-container').html(this.template);
  },

  addAll: function(){
    this.collection.each(function(data){
      dummiesIndexViewObject.addOne(data);
    });
  },

  addOne: function(data){
    dummiesListView = new Spa.Views.DummiesListView({model: data})
    this.$el.find('#dummy-list-container').append(dummiesListView.render());
  }
})