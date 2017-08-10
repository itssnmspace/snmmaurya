Spa.Views.DummiesListView = Backbone.View.extend({

  template: JST["spa/templates/dummies/list_view_template"],

  events: {},

  initialize: function(){
    dummiesListViewObject = this;
    _.bindAll(this, 'render');
  },

  render: function(){
    return this.template({modal: this.model.toJSON()})
  }
})