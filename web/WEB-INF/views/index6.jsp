<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width,height=device-height, user-scalable=no" />
    <title>Leaflet.Editable change line color demo</title>
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

    L.EditControl = L.Control.extend({

        options: {
            position: 'topleft',
            callback: null,
            kind: '',
            html: ''
        },

        onAdd: function (map) {
            var container = L.DomUtil.create('div', 'leaflet-control leaflet-bar'),
                link = L.DomUtil.create('a', '', container);

            link.href = '#';
            link.title = 'Create a new ' + this.options.kind;
            link.innerHTML = this.options.html;
            L.DomEvent.on(link, 'click', L.DomEvent.stop)
                .on(link, 'click', function () {
                    window.LAYER = this.options.callback.call(map.editTools);
                }, this);

            return container;
        }

    });

    L.NewLineControl = L.EditControl.extend({

        options: {
            position: 'topleft',
            callback: map.editTools.startPolyline,
            kind: 'line',
            html: '\\/\\'
        }

    });

    map.addControl(new L.NewLineControl());


    var line = L.polyline([
        [43.1292, 1.256],
        [43.1295, 1.259],
        [43.1291, 1.261],
    ]).addTo(map);
    line.enableEdit();
    var line2 = L.polyline([
        [43.1239, 1.244],
        [43.123, 1.253],
        [43.1252, 1.255],
        [43.1250, 1.251],
    ]).addTo(map);
    line2.enableEdit();
    map.on('editable:editing', function (e) {
        e.layer.setStyle({color: 'DarkRed'});

       /* myltlng = line2.getLatLng();
        strltlng = myltlng.toString();
        console.log(strltlng);*/
    });

    map.on('editable:vertex:ctrlclick editable:vertex:metakeyclick', function (e) {
        e.vertex.continue();
    });

    //can grab on to the leaflet draw events here and register whatever we want them to do.
   /* map.on('draw:created', function (e) {
        const type = e.layerType;
        const layer = e.layer;

        // When a user finishes editing a shape we get that information here
        // editableLayers.addLayer(layer);
        console.log('draw:created->');
        console.log(JSON.stringify(layer.toGeoJSON()));
    });*/

    /*map.on('click', function (e) {
       alert(line2.latlng);
    });*/


</script>
</body>
</html>