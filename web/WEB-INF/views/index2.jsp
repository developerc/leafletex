<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Leaflet Polyline Example</title>

    <%--<link rel="stylesheet" href="leaflet/leaflet.css" />--%>
    <!--[if lte IE 8]><!--<link rel="stylesheet" href="leaflet/leaflet.ie.css" />--><![endif]-->

    <%--<script src="leaflet/leaflet.js"></script>--%>

    <link rel="stylesheet" href="/css/leaflet.css" />
    <script src="/js/leaflet.js"></script>

    <script language="javascript">
        function init() {
            var map = new L.Map('map');

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors',
                maxZoom: 18
            }).addTo(map);
            map.attributionControl.setPrefix(''); // Don't show the 'Powered by Leaflet' text.

            //Define an array of Latlng objects (points along the line)
            var polylinePoints = [
                new L.LatLng(51.51032167, -0.187084072),
                new L.LatLng(51.51019814, -0.187030437),
                new L.LatLng(51.51013137, -0.187845822),
                new L.LatLng(51.50457546, -0.185415744),
                new L.LatLng(51.50476244, -0.181875224),
                new L.LatLng(51.50457546, -0.179622177),
                new L.LatLng(51.50409462, -0.175459380),
                new L.LatLng(51.50368057, -0.174365042),
                new L.LatLng(51.50299938, -0.174729820),
                new L.LatLng(51.50213117, -0.174686903),
                new L.LatLng(51.50199760, -0.177412030),
                new L.LatLng(51.50179725, -0.180373197),
                new L.LatLng(51.50143660, -0.180351735),
            ];

            var polylineOptions = {
                color: 'blue',
                weight: 6,
                opacity: 0.9
            };

            var polyline = new L.Polyline(polylinePoints, polylineOptions);

            map.addLayer(polyline);

            // zoom the map to the polyline
            map.fitBounds(polyline.getBounds());
        }
    </script>
</head>
<body onLoad="javascript:init();">
<div id="map" style="height: 200px"></div>

</body>
</html>

