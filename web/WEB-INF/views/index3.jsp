<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width,height=device-height, user-scalable=no" />
    <title>Leaflet.Editable continue line demo</title>
    <%--<link rel="stylesheet" href="https://npmcdn.com/leaflet@1.2.0/dist/leaflet.css" />--%>
    <%--<script src="https://npmcdn.com/leaflet@1.2.0/dist/leaflet.js"></script>--%>
    <link rel="stylesheet" href="/css/leaflet.css" />
    <script src="/js/leaflet.js"></script>

    <script src="https://npmcdn.com/leaflet.path.drag/src/Path.Drag.js"></script>
    <script src="/js/Leaflet.Editable.js"></script>

    <style type='text/css'>
        body { margin:0; padding:0; }
        #map { position:absolute; top:0; bottom:0; right: 0; left: 0; width:100%; }
    </style>
</head>
<body>
<div id='map'></div>

<script type="text/javascript">
    var startPoint = [43.1249, 1.254];
    var map = L.map('map', {editable: true}).setView(startPoint, 16),
        tilelayer = L.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {maxZoom: 20, attribution: 'Data \u00a9 <a href="http://www.openstreetmap.org/copyright"> OpenStreetMap Contributors </a> Tiles \u00a9 HOT'}).addTo(map);

    var line = L.polyline([
        [43.1292, 1.256],
        [43.1295, 1.259],
        [43.1291, 1.261],
    ]).addTo(map);
    line.enableEdit();
    var line2 = L.polyline([
        [
            [43.1239, 1.244],
            [43.123, 1.253],
            [43.1252, 1.255],
            [43.1250, 1.251],
        ],
        [
            [43.1251, 1.249],
            [43.1252, 1.246],
        ]
    ]).addTo(map);
    // line2.enableEdit();
    map.on('editable:vertex:ctrlclick editable:vertex:metakeyclick', function (e) {
        e.vertex.continue();
    });

</script>
</body>
</html>
