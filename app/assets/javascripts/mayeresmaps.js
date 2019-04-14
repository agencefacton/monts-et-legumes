document.addEventListener('DOMContentLoaded', function() {
  var mayeresMap = document.querySelector('#mayeres-map');

  if (mayeresMap) {
    var center = [4.416206, 45.715559];
    mapboxgl.accessToken = 'pk.eyJ1IjoidGlwaGFuaWUiLCJhIjoiY2p0eGdicG93MXppZTQ2bnAwY216aHBzdSJ9.lyfhoMkm42jpfn4b0-yB5Q';
    var map = new mapboxgl.Map({
      container: mayeresMap,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: center,
      zoom: 14
    });
    new mapboxgl.Marker().setLngLat(center).addTo(map);
    map.addControl(new mapboxgl.NavigationControl());

    $('#mayeresModal').on('shown.bs.modal', function(e) {
      map.resize();
    });
  }
});
