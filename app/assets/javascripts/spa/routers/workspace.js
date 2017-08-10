Spa.Routers.WorkSpace = Backbone.Router.extend({
  initialize: function(options){
  },

  routes: {
    "spa": "dummyApplication",
    "index": "dummyApplication",
    "users/:id/orders/": "ordersIndex"
  },
  
  dummyApplication: Spa.Controllers.Dummies.index
});


$(document).ready(function(){
  window.router = new Spa.Routers.WorkSpace();
  Backbone.history.start({pushState: true});
})