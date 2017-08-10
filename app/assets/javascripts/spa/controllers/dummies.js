Spa.Controllers.Dummies = {};

Spa.Controllers.Dummies.index = function(){
  var dummies = new Spa.Collections.Dummies();

  dummies.fetch().then( function(response) {
    new Spa.Views.DummiesIndexView({collection: new Spa.Collections.Dummies(response.data)})
  });
};

Spa.Controllers.Dummies.show = function(){

};

Spa.Controllers.Dummies.edit = function(){

};
Spa.Controllers.Dummies.update = function(){

};

Spa.Controllers.Dummies.new = function(){

};

Spa.Controllers.Dummies.create = function(){

};

Spa.Controllers.Dummies.destroy = function(){

};

// Spa.Controllers.Person.show = function(id) {
//   var aMa = new AppName.Models.Person({id: id});
  
//   aMa.updateAge(25);
  
//   aMa.fetch().done(function(){
//     var view = new AppName.Views.Show({model: aMa});
//   });
// };