<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>leafletex</title>

  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />

  <%--<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>--%>
  <%--<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>--%>
  <link rel="stylesheet" href="/css/leaflet.css" />
  <script src="/js/leaflet.js"></script>
</head>
  <body>
  <div id="mapid" style="width: 100%; height: 100%;"></div>
  <script>
      var mymap = L.map('mapid').setView([45.852717, 40.131683], 12);

      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
          maxZoom: 20,
          attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
          '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
          'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>' + 'ПАО Ростелеком ЛТЦ Тихорецкий район',
          id: 'mapbox.streets'
      }).addTo(mymap);

      // GetMarkerCoords();

      var popup = L.popup();

      function onMapClick(e) {
          /*popup
              .setLatLng(e.latlng)
              .setContent("You clicked the map at " + e.latlng.toString())
              .openOn(mymap);*/
          var latlngs = [
              [40.104218, 45.849608],
              [40.159492, 45.770995]
          ];
          var polyline = L.polyline(latlngs, {color: 'red'}).addTo(map);
          mymap.fitBounds(polyline.getBounds());
      }

      mymap.on('click', onMapClick);
  </script>
  </body>
</html>
