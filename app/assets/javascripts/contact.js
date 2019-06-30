// document.addEventListener('DOMContentLoaded', function() {
//   var contact = document.querySelector('#market-map');

//   if (marketMap) {
//     var center = [4.7926143, 45.6949815];
//     mapboxgl.accessToken = 'pk.eyJ1IjoidGlwaGFuaWUiLCJhIjoiY2p0eGdicG93MXppZTQ2bnAwY216aHBzdSJ9.lyfhoMkm42jpfn4b0-yB5Q';
//     var map = new mapboxgl.Map({
//       container: marketMap,
//       style: 'mapbox://styles/mapbox/streets-v11',
//       center: center,
//       zoom: 14
//     });
//     new mapboxgl.Marker().setLngLat(center).addTo(map);
//     map.addControl(new mapboxgl.NavigationControl());

//     $('#mapModal').on('shown.bs.modal', function(e) {
//       map.resize();
//     });
//   }
// });
