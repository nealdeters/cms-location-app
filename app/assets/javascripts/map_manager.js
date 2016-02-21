var MapManager = function ()  {
  var map;

  this.initMap = function (obj) {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: obj.lat , lng: obj.long},
      zoom: 8
    });
  }
}
