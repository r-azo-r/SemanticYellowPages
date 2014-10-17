<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>RGraph - Tree Animation</title> 
<!-- CSS Files --> 
<link type="text/css" href="base.css" rel="stylesheet" /> 
<link type="text/css" href="RGraph.css" rel="stylesheet" />  
<!--[if IE]><script language="javascript" type="text/javascript" src="../../Extras/excanvas.js"></script><![endif]--> 

<!-- JIT Library File --> 
<script  type="text/javascript" src="jit.js"></script>
<script  type="text/javascript">

var labelType, useGradients, nativeTextSupport, animate;
(function() {
  var ua = navigator.userAgent, iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

var Log = {
  elem: false,
  write: function(text){
    if (!this.elem) 
      this.elem = document.getElementById('log');
    this.elem.innerHTML = text;
 //  this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
  }
};
function getQuerystring(key, default_)
{
  if (default_==null) default_=""; 
  key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
  var qs = regex.exec(window.location.href);
  if(qs == null)
    return default_;
  else
    return qs[1];
};
function init(){
	
var temp =document.getElementById("mydiv").innerHTML;
//alert(temp);
var json  = eval('('+temp+')');


//alert(json);
//

    //init RGraph
    var rgraph = new $jit.RGraph({
        //Where to append the visualization
        injectInto: 'infovis',
        //Optional: create a background canvas that plots
        //concentric circles.

        background: {   CanvasStyles: {   strokeStyle: '#555'  }    },
        //Add navigation capabilities:
        //zooming by scrolling and panning.
        Navigation: {  enable: true,  panning: true,zooming: 10     },
        //Set Node and Edge styles.
        Node: {   color: '#ddeeff'     },    
        Edge: {  color: '#C17878', lineWidth:1.5 },
        onBeforeCompute: function(node){
            Log.write("centering " + node.name + "...");
            //Add the relation list in the right column.
            //This list is taken from the data property of each JSON node.
            $jit.id('inner-details').innerHTML = node.data.relation;
        },    
        onAfterCompute: function(){
            Log.write("done");
        },
        //Add the name of the node in the correponding label
        //and a click handler to move the graph.
        //This method is called once, on label creation.
        onCreateLabel: function(domElement, node){
            domElement.innerHTML = node.name;
            domElement.onclick = function(){
                rgraph.onClick(node.id);            };
        },
        //Change some label dom properties.
        //This method is called each time a label is plotted.
        onPlaceLabel: function(domElement, node){
            var style = domElement.style;
            style.display = '';
            style.cursor = 'pointer';
            if (node._depth <= 1) {  
                style.fontSize = "0.8em";
                style.color = "#ccc";
            } else if(node._depth == 2){
                style.fontSize = "0.7em";
                style.color = "#494949";
            } else {
                style.display = 'none';
            }
            var left = parseInt(style.left);
            var w = domElement.offsetWidth;
            style.left = (left - w / 2) + 'px';
        }
    });

    //load JSON data
    
    rgraph.loadJSON(json);
   //trigger small animation
    rgraph.graph.eachNode(function(n) {
      var pos = n.getPos();
      pos.setc(-200, -200);

    });

    rgraph.compute('end');
    rgraph.fx.animate({
      modes:['polar'],
      duration: 2000
    });
    //end
    //append information about the root relations in the right column
    $jit.id('inner-details').innerHTML = rgraph.graph.getNode(rgraph.root).data.relation;

}

</script>
</head> 
<body onload="init();"> 
<div id="container">
<div id="left-container" style="width:0px"> 

<div class="text"> 
<h4>
</div> 
<div id="id-list"></div> 
<div style="text-align:center;">
<a href="example1.js">See the Example Code</a></div>            
<input type="button" onclick="init();" value="ClickMe"/>
</div> 
<div id="center-container"> 

    <div id="infovis"></div>  
</div> 
<div id="right-container"> 
<div id="inner-details"></div> 

</div> 
<div id="log" style="left:355px"></div> 

</div> 
<div id="mydiv" style="display:none" ><%
String temp =session.getAttribute("graph").toString();
out.println(temp);

%>
</div>
</body> 
</html>