<html>
<head>
<link rel="stylesheet" type="text/css" href="scripts/bootstrap-5.3.2-dist/css/bootstrap.min.css">
<script
  src="scripts/jquery-3.7.1.js"></script>
<script type="text/javascript"  src="scripts/typeahead.bundle.js" ></script>
<script type="text/javascript" src="scripts/canvasjs/canvasjs-stockchart-1.7.38/canvasjs.stock.min.js"></script>
<script src="scripts/core-2.11.8/package/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<script
  src="scripts/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
  
  
  
<script type="text/javascript">
<!-- // start js

var chart_containers = new Map();
var ngs = [];
var cds = new Map();

var tas = [];
var ticker_symbols = null;

function manage_chart_height(e) {
  var r = e.target;
  
  var cs = r.value;
  
  var s = r.id.split("-");
  var k = s[3];
  var cn = s[5];
  
  var c = chart_containers.get('chart-'+k+'-container');
  var ci = get_chart_indx_from_name(k, cn);
  
  c.charts[ci].set('height', cs + '%');
  
  var bchvi = 'span[id="chart-height-value' + r.id.substring(12)+'"]';
  $(bchvi).text(cs + '%');  
}

function search_stripline(stripLines, sv, ev) {

	for (var i =0; i < stripLines.length; ++i) {
		if (sv == stripLines[i].startValue && ev == stripLines[i].endValue) {
			return i;
		}
	}

	return -1;
}

function get_bar_chart_ds_indx_from_name(k, cn, dn) {
  var c = chart_containers.get('chart-'+k+'-container');
  for (var i =0; i < c.data.length; ++i) {
    if (c.title.get('text') == cn && c.data[i].name == dn) {
      return i;
    }
  }
  
  return -1;
  
}

function vp_remove_support_resistance_lines(tk, tcn, tdn, k, cn, dn) {
	// get the bar chart
	var c = chart_containers.get('chart-'+k+'-container');
  var dsi = get_bar_chart_ds_indx_from_name(k, cn, dn);
  var vpct = $('input[name="vpchart-type-k-'+k+'-c-'+cn+'-d-'+dn+'"]:checked').first().val();
  
  
  var taxis = get_axis_y_any_type(tk, tcn, tdn);
  
	for (var i =0; i < c.data[dsi].dataPoints.length; ++i) {
    var p1 = c.data[dsi].dataPoints[i].p1;
    var p2 = c.data[dsi].dataPoints[i].p2;
    var zl = c.data[dsi].dataPoints[i].zl;
    var zh = c.data[dsi].dataPoints[i].zh;
    
    if (vpct == 'ATRHL') {
      var sli = search_stripline(taxis.stripLines, p1, p2);
      if (sli >= 0) {
        taxis.stripLines[sli].remove();
      }
    } else if (vpct == 'ZONEHL') {
      var sli = search_stripline(taxis.stripLines, zl, zh);
      if (sli >= 0) {
        taxis.stripLines[sli].remove();
      }
    }
	}
}

function onvpcharttypechange(tk,tcn,tdn,k,cn,dn,cv) {
  var tc = chart_containers.get('chart-'+tk+'-container');
  var tci = get_chart_indx_from_name(tk, tcn);
  var tdsi = get_ds_indx_from_name(tk, tcn, tdn);

	
          
        
	var c = chart_containers.get('chart-'+k+'-container');
  var dsi = get_bar_chart_ds_indx_from_name(k, cn, dn);
  for (var i =0; i < c.data[dsi].dataPoints.length; ++i) {
      if (cv == 'ATRHL') {
        var taxis = get_axis_y_any_type(tk, tcn, tdn);
        var sli = search_stripline(taxis.stripLines, c.data[dsi].dataPoints[i].zl, c.data[dsi].dataPoints[i].zh);
        if ( sli >= 0) {
            
            taxis.stripLines[sli].remove();
            taxis.addTo('stripLines', {
                startValue:c.data[dsi].dataPoints[i].p1,
                endValue:c.data[dsi].dataPoints[i].p2});
        }

      } else if (cv == 'ZONEHL') { 
        var taxis = get_axis_y_any_type(tk, tcn, tdn);
        var sli = search_stripline(taxis.stripLines, c.data[dsi].dataPoints[i].p1, c.data[dsi].dataPoints[i].p2);
        if (sli >= 0) {
            
            taxis.stripLines[sli].remove();
            taxis.addTo('stripLines', {
                startValue:c.data[dsi].dataPoints[i].zl,
                endValue:c.data[dsi].dataPoints[i].zh});
              }

          }
      }
}

function get_axis_y_any_type(k, cn, dn) {
  var c = chart_containers.get('chart-'+k+'-container');
  var ci = get_chart_indx_from_name(k, cn);
  var dsi = get_ds_indx_from_name(k, cn, dn);
  
  if (c.charts[ci].data[dsi].axisYType == 'primary') {
    return  Array.isArray(c.charts[ci].axisY) ? c.charts[ci].axisY[c.charts[ci].data[dsi].axisYIndex] : c.charts[ci].axisY;
  } else if (c.charts[ci].data[dsi].axisYType == 'secondary') {
    return Array.isArray(c.charts[ci].axisY2) ? c.charts[ci].axisY2[c.charts[ci].data[dsi].axisYIndex] : c.charts[ci].axisY2;	
  }
}


function manage_volume_profile_indicator(chkbxv, ischkbxchecked) {
  var s = chkbxv.split(",");
  var k = s[0];
  var cn = s[1];
  var dn = s[2];
  var indn = s[3];
  var indv = s[4];
  var tk = s[5];
  var tcn = s[6];
  var tdn = s[7];
  
  
  var adn = dn.split('_');
  var ts = adn[0];
  var tf = adn[1];

  var tc = chart_containers.get('chart-'+tk+'-container');
  var tci = get_chart_indx_from_name(tk, tcn);
  var tdsi = get_ds_indx_from_name(tk, tcn, tdn);

  

  if (ischkbxchecked) {
        //alert(chkbxv);
    var nk = k;
    if (k == -1) {
      nk = get_new_chart_container();
      s[0]=nk;
      $('input[id="indicator-chart-k-'+tk+'-c-'+cn+'-d-'+dn+'"]').val(s.join(','));
    } 

    $.get('volumeprofile.php?qs='+encodeURIComponent(ts)+'&qtf='+tf+'&qindv='+indv,function (ajxdata, status) {
      
      var ondpclick = function (e) {
        var zl = e.dataPoint.zl;
        var zh = e.dataPoint.zh; 
        var p1 = e.dataPoint.p1;
        var p2 = e.dataPoint.p2; 
        
        var taxis = get_axis_y_any_type(tk, tcn, tdn); 
        
        var vpct = $('input[name="vpchart-type-k-'+nk+'-c-'+cn+'-d-'+dn+'"]:checked').first().val();
        var sv = (vpct == 'ZONEHL' ? zl : p1);
        var  ev = (vpct == 'ZONEHL' ? zh : p2);       
        var sli = search_stripline(taxis.stripLines, sv, ev);
        if (sli >= 0) {
          taxis.stripLines[sli].remove();
        } else {
          
        	taxis.addTo('stripLines', {
                startValue:sv,
                endValue:ev});
        }
        
      };
      var dpa = [];
      for (var i=0; i < ajxdata.length; ++i) {
          dpa.push({x: Number(ajxdata[i].p1), y: Number(ajxdata[i].v), zl: Number(ajxdata[i].zl), zh: Number(ajxdata[i].zh), p1: Number(ajxdata[i].p1), p2: Number(ajxdata[i].p2),click: ondpclick});
      }
      
      var taHTML = '<div class="col" id="ta-'+nk+'"><div class="row">'+
                      '<div class="col" id="chart-menu-'+nk+'">' +
      
                      '</div></div></div>';
      $('#ta').append(taHTML);
      create_bar_chart(nk, cn, dn, dpa);
      var vpcm = get_volume_profile_chart_menu(tk,tcn, tdn, nk, cn, dn);
      $('#chart-menu-'+nk).append(vpcm);
      	
      render_all_charts();
      var nvpc = chart_containers.get('chart-'+nk+'-container');
      nvpc.set('height', tc.get('height'));
      var taxis = get_axis_y_any_type(tk, tcn, tdn);
      nvpc.axisX[0].set('minimum', taxis.get('minimum'));
      nvpc.axisX[0].set('maximum', taxis.get('maximum'));	
      
    });
  } else {
    close_volume_profile_indicator_chart(tk, k,cn, dn) 
  }
}



function manage_macd_indicator(chkbxv, ischkbxchecked) {

  var s = chkbxv.split(",");
  var k = s[0];
  var cn = s[1];
  var dn = s[2];
  var indn = s[3];
  var indv = s[4];
  var tcn = s[5];
  var tdn = s[6];
  
  var adn = dn.split('_');
  var ts = adn[0];
  var tf = adn[1];
    
  if (ischkbxchecked) {
    $.get('macd.php?qs='+encodeURIComponent(ts)+'&qtf='+tf+'&qindv='+indv,function (ajxdata, status) {
    
      var c = chart_containers.get('chart-'+k+'-container');
      var ci = get_chart_indx_from_name(k, tcn);
      var tdi = get_ds_indx_from_name(k, tcn, tdn) ;
      var ayt = c.charts[ci].data[tdi].axisYType;
      var ayi = c.charts[ci].data[tdi].axisYIndex;
      var histdn = dn+'HISTOGRAM';
      var signaldn = dn+'SIGNALLINE';
      var co = get_new_chart_obj(k, cn, histdn, 'column');
      var dobjMACD = get_new_data_obj(dn, "line", ayt, ayi);
      var dobjSignalLine = get_new_data_obj(signaldn, "line", ayt, ayi);
      for(var i = 0; i < ajxdata.length; i++){
        var ddate = ajxdata[i][0];
        var macd = ajxdata[i][1];
        var signalline = ajxdata[i][2];
        
        co.data[0].dataPoints.push({x: new Date(ddate), y: Number(Number(macd) - Number(signalline)), color: Number(macd) > Number(signalline) ? "green" : "red"});
        dobjMACD.dataPoints.push({x: new Date(ddate), y: Number(macd)});
        dobjSignalLine.dataPoints.push({x: new Date(ddate), y: Number(signalline)});
      }
      c.addTo('charts', co);
      c.charts[c.charts.length-1].addTo('data', dobjMACD);
      c.charts[c.charts.length-1].addTo('data', dobjSignalLine);
      
      var ind_menu_html = get_macd_ind_menu(k, cn, dn);
      $('#chart-menu-'+k).append(ind_menu_html);
    }); // end ajax
    
  } else {
    close_macd_indicator_chart(k, cn, dn);
    //remove_chart(k, cn, true);
  }
}




function manage_volume_indicator(chkbxv, ischkbxchecked) {

  var s = chkbxv.split(",");
  var k = s[0];
  var cn = s[1];
  var dn = s[2];
  var indn = s[3];
  var indv = s[4];
  
  var adn = dn.split('_');
  var ts = adn[0];
  var tf = adn[1];
    
  if (ischkbxchecked) {
    $.get('volume.php?qs='+encodeURIComponent(ts)+'&qtf='+tf+'&qindv='+indv,function (ajxdata, status) {
    
      var c = chart_containers.get('chart-'+k+'-container');
      var co = get_new_chart_obj(k, cn, dn, 'column');
      for(var i = 0; i < ajxdata.length; i++){
        var ddate = ajxdata[i][0];
        var v = ajxdata[i][1];
        var open_price = ajxdata[i][2];
        var close_price = ajxdata[i][3];
        
        co.data[0].dataPoints.push({x: new Date(ddate), y: Number(v), color: open_price < close_price ? "green" : "red"});
      }
      c.addTo('charts', co);
      update_navigator(k);
      
      var ind_menu_html = get_volume_ind_menu(k, cn, dn, indv);
      $('#chart-menu-'+k).append(ind_menu_html);
    }); // end ajax
    
  } else {
    close_volume_indicator_chart(k, cn, dn);
  }
}

function manage_rsi_indicator (chkbxv, ischkbxchecked) {
  var s = chkbxv.split(",");
  var k = s[0];
  var rsitcn = s[1];
  var rsitdn = s[2];
  var cn = s[3]; 
  var dn = s[4];
  var rp = s[5];
  
  var adn = dn.split('_');
  var ts = adn[0];
  var tf = adn[1];
  var indn = adn[3];  
  
    
  if (ischkbxchecked) {
    if (get_ds_indx_from_name(k, cn, dn) >=0) {
      /* data series already exists */
      return ;
    }
    $.get('rsi.php?qs='+encodeURIComponent(ts)+'&qtf='+tf+'&qindn='+indn+'&qrp='+rp,function (ajxdata, status) {
    
      var c = chart_containers.get('chart-'+k+'-container');
      var ci = get_chart_indx_from_name(k, rsitcn);
      var tdi = get_ds_indx_from_name(k, rsitcn, rsitdn) ;
      var ayt = c.charts[ci].data[tdi].axisYType;
      var ayi = c.charts[ci].data[tdi].axisYIndex;
      var co = get_new_chart_obj(k, cn, dn, 'line');
      var dobj = get_new_data_obj(dn, "line", ayt, ayi);
      for(var i = 0; i < ajxdata.length; i++){
        if (!isNaN(ajxdata[i].rsi_p)) {
          co.data[0].dataPoints.push({x: new Date(ajxdata[i].ddatetime), y: Number(ajxdata[i].rsi_p)});

          dobj.dataPoints.push({x: new Date(ajxdata[i].ddatetime), y: Number(ajxdata[i].rsi_p)});
        }
      }
      c.addTo('charts', co);
      //c.charts[ci].addTo('data', dobj);
    
    }); // end ajax
    
  } else {
    close_rsi_indicator_chart(k, cn, dn) ;
  }
}

function manage_ema_indicator (chkbxv, ischkbxchecked) {
  var s = chkbxv.split(",");
  var k = s[0];
  var cn = s[1];
  var etdn = s[2];
  var dn = s[3];
  var ep = s[4];
  
  var adn = dn.split('_');
  var ts = adn[0];
  var tf = adn[1];
  var indn = adn[3];  
  
    
  if (ischkbxchecked) {
    if (get_ds_indx_from_name(k, cn, dn) >=0) {
      /* data series already exists */
      return ;
    }
    $.get('ema.php?qs='+encodeURIComponent(ts)+'&qtf='+tf+'&qindn='+indn+'&qep='+ep,function (ajxdata, status) {
    
      var c = chart_containers.get('chart-'+k+'-container');
      var ci = get_chart_indx_from_name(k, cn);
      var tdi = get_ds_indx_from_name(k, cn, etdn) ;
      var ayt = c.charts[ci].data[tdi].axisYType;
      var ayi = c.charts[ci].data[tdi].axisYIndex;
      var dobj = get_new_data_obj(dn, "line", ayt, ayi);
      for(var i = 0; i < ajxdata.length; i++){
        if (!isNaN(ajxdata[i].ema_p)) {
          dobj.dataPoints.push({x: new Date(ajxdata[i].ddatetime), y: Number(ajxdata[i].ema_p)});
        }
      }
      c.charts[ci].addTo('data', dobj);
    
    }); // end ajax
    
  } else {
    remove_ds(k, cn, dn) ;
  }
}

function update_navigator(k) {
  var c = chart_containers.get('chart-'+k+'-container');
  var cns = c.navigator.enabled; 
  if (c.charts.length == 0) {
    if (c.navigator.enabled) {
      if (c.navigator.data.length > 0) {
        c.navigator.data[0].remove();
      }
    } else {
      c.navigator.options.data = [];
    }
    return;
  }
  
  var ohlcidi = get_ohlc_chart_index_ds_index(k);
  
  if (ohlcidi[0] >= 0) {
    var ds = c.charts[ohlcidi[0]].data[ohlcidi[1]];
    // if ds and navigator ds are same. no need to update navigator

    var dp = [];
    var is_nav_same = true;

    for (i =0; i < ds.dataPoints.length; ++i) {
      var x = ds.dataPoints[i].x;
      var y = ds.dataPoints[i].y;
      var close = y[3];
      dp.push({x: x, y: close});
      if (c.navigator.options.data.length == 0 || (c.navigator.options.data[0].dataPoints.length-1) < i ||  c.navigator.options.data[0].dataPoints[i].y != close) {
        is_nav_same = false;
      }
    }

    if (is_nav_same && c.navigator.options.data[0].dataPoints.length == dp.length) return;
    
    if (c.navigator.options.data.length == 0) {
      var ndo = get_new_navigator_data_obj();
      ndo.dataPoints = dp;
      c.navigator.set('enabled', true);
      c.navigator.addTo("data", ndo);
      c.navigator.set('enabled', cns);
    } else {
      c.navigator.set('enabled', true);
      c.navigator.options.data[0].dataPoints = dp;
      c.render();
      c.navigator.set('enabled', cns);
    }
  } else {
   var linecidi = get_chart_index_ds_index(k, 'line');
   if (linecidi[0] >= 0) {
    var ds = c.charts[linecidi[0]].data[linecidi[1]];
    // if ds and navigator ds are same. no need to update navigator

    var dp = [];
    var is_nav_same = true;

    for (i =0; i < ds.dataPoints.length; ++i) {
      var x = ds.dataPoints[i].x;
      var y = ds.dataPoints[i].y;
      var close = y;
      dp.push({x: x, y: close});
      if (c.navigator.options.data.length == 0 || (c.navigator.options.data[0].dataPoints.length-1) < i ||  c.navigator.options.data[0].dataPoints[i].y != close) {
        is_nav_same = false;
      }
    }

    if (is_nav_same && c.navigator.options.data[0].dataPoints.length == dp.length) return;
    
    if (c.navigator.options.data.length == 0) {
      var ndo = get_new_navigator_data_obj();
      ndo.dataPoints = dp;
      c.navigator.set('enabled', true);
      c.navigator.addTo("data", ndo);
      c.navigator.set('enabled', cns);
    } else {
      c.navigator.set('enabled', true);
      c.navigator.options.data[0].dataPoints = dp;
      c.render();
      c.navigator.set('enabled', cns);
    }
   } 
  }
}

function populatechart(k, ts, am) {
  
  var tsa = ts.split('_');
  var qs = tsa[0];
  var qtf = tsa[1];
  var cnum = tsa[2];
  
	$.get('ohlc.php?qs='+encodeURIComponent(qs)+'&qtf='+encodeURIComponent(qtf),function (ajxdata, status) {
    
    var c = chart_containers.get('chart-'+k+'-container');
  
    if (am == 0) {
      // preserve settings from old chart so that it can be applied to new chart
      
      // preserve chart height settings from old chart so that it can be applied to new chart
      
      var chi = $("input[id^='chart-height-'][type=range]" );
      var achi = [];
      var achv = [];
      for (var i =0; i < chi.length; ++i) {
        if (chi[i].id.startsWith('chart-height-k-'+k)) {
          achi.push(chi[i].id);
          achv.push(chi[i].value);
          // remove all active indicators.
        }
      }
      
      //preserve indicator settings
      var si = $("input[name^='indicator-'][type=checkbox]:checked" );
      var asi = [];
      for (var i =0; i < si.length; ++i) {
        if (si[i].id.startsWith('indicator-chart-k-'+k) || si[i].id.startsWith('indicator-ds-k-'+k) ) {
          asi.push(si[i].id);
          // remove all active indicators.
          si[i].click();
        }
      }
      
      
      
      

      // 0 - analyze single chart mode;
      // prepare by removing all charts.
      for (var i = c.charts.length-1; i >= 0; --i) {
        // do not remove global charts.
        if (!c.charts[i].title.get('text').startsWith('NSEEODADR_D')) {
          //remove chart
          remove_chart(k, c.charts[i].title.get('text'), false);
        }
      }
      if (c.charts.length != 0) {
        // assuming only global charts have not been removed and one gm chart is present. will populate chart in stacked mode.
        populatechart(k, ts, 2);
        return ;
      }
      
      //c.charts.length = 0;
      c.set('charts', []);
      update_navigator(k);

      // get new ohlc chart
      var co = get_new_chart_obj(k, ts,ts, 'ohlc');
      for(var i = 0; i < ajxdata.length; i++){
        co.data[0].dataPoints.push({x: new Date(ajxdata[i].ddate), y: [Number(ajxdata[i].open), Number(ajxdata[i].high), Number(ajxdata[i].low), Number(ajxdata[i].close)]});
      }
      c.addTo("charts", co);
      
      update_navigator(k);
      
            
      $('#chart-menu-'+k).empty();
      
      var chart_menu_html = get_chart_menu(k,ts,ts);
      $('#chart-menu-'+k).append(chart_menu_html);
      
      var f = function() {
        for (var i =0; i < asi.length; ++i) {
          var s = asi[i].split('-');
          var cna = s[5].split('_');
          var dna = s[7].split('_');
          
          cna[0] = tsa[0];
          cna[2] = tsa[2];
          var cn = cna.join('_');
          s[5] = cn;
          
          dna[0] = tsa[0];
          dna[2] = tsa[2];
          var dn = dna.join('_');
          s[7] = dn;
          
          var ni = s.join('-');
          
         
          if ($('input[id="'+ni+'"]').prop('checked') != true) {
            //console.log(ni);
            $('#'+ni).click();
          }
        }
        
        // apply chart height settings to new chart
        for (var i =0; i < achi.length; ++i) {
          var s = achi[i].split('-');
          var cna = s[5].split('_');
          var dna = s[7].split('_');
          
          cna[0] = tsa[0];
          cna[2] = tsa[2];
          var cn = cna.join('_');
          s[5] = cn;
          
          dna[0] = tsa[0];
          dna[2] = tsa[2];
          var dn = dna.join('_');
          s[7] = dn;
          
          var ni = s.join('-');

          $('input[id="'+ni+'"]').val(achv[i]);
          $('input[id="'+ni+'"]').trigger("change");
        }
        
      }
      
      f();
      window.setTimeout(f, 1000);
        
    } else if (am == 1) {
      // compare inline
      var ohlcidi = get_ohlc_chart_index_ds_index(k);
      
      if (ohlcidi[0] >= 0) {
        // add ohlc ds to this chart
        c.charts[ohlcidi[0]].addTo('axisY', get_new_axis_y_obj(ts));
        var dobj = get_new_data_obj(ts, c.charts[ohlcidi[0]].data[ohlcidi[1]].type, "primary",c.charts[ohlcidi[0]].options.axisY.length-1 );
        for(var i = 0; i < ajxdata.length; i++){
          dobj.dataPoints.push({x: new Date(ajxdata[i].ddate), y: [Number(ajxdata[i].open), Number(ajxdata[i].high), Number(ajxdata[i].low), Number(ajxdata[i].close)]});
        }
        c.charts[ohlcidi[0]].addTo('data', dobj);
        c.charts[ohlcidi[0]].addTo('subtitles', {text: ts, fontSize: 12, dockInsidePlotArea: true});
        
        var chart_menu_html = get_chart_menu(k, c.charts[ohlcidi[0]].title.get('text'), ts);
        $('#chart-menu-'+k).append(chart_menu_html);
        
      } else {
        // create new chart and ohlc ds and add chart to this chart container
        var co = get_new_chart_obj(k, ts,ts, 'ohlc');
        for(var i = 0; i < ajxdata.length; i++){
          co.data[0].dataPoints.push({x: new Date(ajxdata[i].ddate), y: [Number(ajxdata[i].open), Number(ajxdata[i].high), Number(ajxdata[i].low), Number(ajxdata[i].close)]});
        }
        c.addTo("charts", co);
        update_navigator(k);
        var chart_menu_html = get_chart_menu(k, ts, ts);
        $('#chart-menu-'+k).append(chart_menu_html);
      }
    } else if (am == 2) {
      // compare stacked
      
      var dsi = get_ds_indx_from_name(k, ts, ts);
      if (dsi >= 0) {
        console.log('chart ds by this name already exists: ' + ts);
          return;
      }
      // create new chart and ohlc ds and add chart to this chart container
        var co = get_new_chart_obj(k, ts,ts, 'ohlc');
        for(var i = 0; i < ajxdata.length; i++){
          co.data[0].dataPoints.push({x: new Date(ajxdata[i].ddate), y: [Number(ajxdata[i].open), Number(ajxdata[i].high), Number(ajxdata[i].low), Number(ajxdata[i].close)]});
        }
        c.addTo("charts", co);
        update_navigator(k);
        var chart_menu_html = get_chart_menu(k, ts, ts);
        $('#chart-menu-'+k).append(chart_menu_html);
      
    } else if (am == 3) {
      // compare side by side
      // open chart in new chart container
      
      c = chart_containers.get('chart-'+k+'-container');
      
      var nk = k;
      if (c.charts.length != 0) {
        nk = get_new_chart_container();
        create_ta(nk);
        create_chart_container(nk);
      }
      
      tsa[2] = ngs[nk]++;  
      populatechart(nk, tsa.join('_'), 0);
      render_all_charts();
      
    }
		
	}); // end ajax
}

function get_ohlc_chart_index_ds_index(k) {
  var c = chart_containers.get('chart-'+k+'-container');
  
  for (var i = 0; i < c.charts.length; ++i) {
    for (var j =0; j < c.charts[i].data.length; ++j) {
      if (c.charts[i].data[j].type == 'ohlc' || c.charts[i].data[j].type == 'candlestick') {
        return [i, j];
      }
    }
  }
  
  return [-1, -1];
}

function get_chart_index_ds_index(k, t) {
  var c = chart_containers.get('chart-'+k+'-container');
  
  for (var i = 0; i < c.charts.length; ++i) {
    for (var j =0; j < c.charts[i].data.length; ++j) {
      if (c.charts[i].data[j].type ==t ) {
        return [i, j];
      }
    }
  }
  
  return [-1, -1];
}

function get_chart_indx_from_name(k, cn) {
  var c = chart_containers.get('chart-'+k+'-container');
  
  for (var i = 0; i < c.charts.length; ++i) {
    if (c.charts[i].title.get('text') == cn) {
      return i;
    }
  }
  
  return -1;
}


function get_ds_indx_from_name(k, cn, dn) {
  var c = chart_containers.get('chart-'+k+'-container');
  
  for (var i = 0; i < c.charts.length; ++i) {
    if (c.charts[i].title.get('text') == cn) {
      for (var j = 0; j < c.charts[i].data.length; ++j) {
        if (c.charts[i].data[j].name == dn) {
          return j;
        }
      }
      
    }
  }
  
  return -1;
} 

function oncharttypechange(k, cn, dn) {
  if ($('input[name="chart-type-k-'+k+'-c-'+cn+'-d-'+dn+'"]:checked').length > 0) {
    var c = chart_containers.get('chart-'+k+'-container');
    var ci = get_chart_indx_from_name(k, cn) ;
    var di = get_ds_indx_from_name(k, cn, dn);
    c.charts[ci].data[di].set("type", $('input[name="chart-type-k-'+k+'-c-'+cn+'-d-'+dn+'"]:checked').first().val());
  }

}

function render_all_charts() {

  chart_containers.forEach(function (mv, mk, m) {mv.render();});
}


function reset_chart_indices(k, cn, rci) {
  var nc = [];
  var c = chart_containers.get('chart-'+k+'-container');
  
  for (var i = 0; i < c.charts.length && rci >= 0; ++i) {
    if (i != rci) {
      nc.push(c.options.charts[i]);
    }
  }
  
  c.set('charts', nc);
  
}

function remove_volume_profile_bar_chart(k) {
	var c = chart_containers.get('chart-'+k+'-container');
  for (var i =0; i < c.data.length; ++i) {
    c.data[i].remove();
  }
	c.destroy();
	c = null;
	chart_containers.delete('chart-'+k+'-container');
  $('#chart-'+k+'-container').remove();
  $('#chart-'+k+'-col').remove(); // remove chart container column and html
	if($('#ta').children().length > 1) {
      $('#ta-'+k).remove();
      render_all_charts();
  }
}

function remove_chart(k, cn, rccie) {
      var rv = false;
      var c = chart_containers.get('chart-'+k+'-container');
      
      var ci = get_chart_indx_from_name(k, cn) ;
      if (ci >= 0 && c.charts.length > ci && c.charts[ci] != undefined && c.charts[ci] != null ) {
        if (c.charts[ci].data!=undefined && c.charts[ci].data != null) {
          for (var j =c.charts[ci].data.length -1 ;  j>=0 ; --j) {
            c.charts[ci].data[j].remove();
          }
        }
        
        if (c.charts[ci].data.length <= 0) {
          c.charts[ci].destroy();
          reset_chart_indices(k, cn, ci);
          update_navigator(k);
          $('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+cn+'"]').remove(); // remove chart menu
          if (c.charts.length <=0 && rccie) {
            /* no charts; remove chart container */
            if (c.navigator.data != undefined && c.navigator.data != null && c.navigator.data.length > 0) {
              c.navigator.data[0].remove();
            }
            c.destroy();
            chart_containers.delete('chart-'+k+'-container');
            $('#chart-'+k+'-container').remove(); 
            $('#chart-'+k+'-col').remove(); // remove chart container column and html 
            if($('#ta').children().length > 1) {
              $('#ta-'+k).remove();
              render_all_charts();
            }
          }
          rv = true;
        }
      }
      
      return rv;
}

function remove_ema_ds(k, cn, dn, frcie) {
      var emap = [1, 2, 3, 5, 8, 9, 10, 11, 12, 13, 14, 20, 21, 26, 34, 50, 55, 89, 100, 144, 200, 233];
      var c = chart_containers.get('chart-'+k+'-container');
      
      var ci = get_chart_indx_from_name(k, cn) ;
      if (ci >= 0) {
        for (i =0; i < emap.length; ++i) {
          var di = get_ds_indx_from_name(k, cn, dn+'_EMA'+emap[i]) ;
          
          if (ci>=0 && di >=0) {
            remove_ds(k, cn, dn+'_EMA'+emap[i], frcie);
          }
        }
      }
}


function update_axisy(k, ci, rdi) {
  var c = chart_containers.get('chart-'+k+'-container');
  var axisYType = c.charts[ci].data[rdi].axisYType;
  if (axisYType == "primary") {
    var axisYIndex = c.charts[ci].data[rdi].axisYIndex;
    
    var activeAxisY = [];
    
    for (var i =0; i < c.charts[ci].axisY.length; ++i) {
      if (i != axisYIndex) {
        activeAxisY.push(c.charts[ci].options.axisY[i]);
      }
    }
    
    c.charts[ci].set('axisY', activeAxisY);
    
    for (var i=0; i < c.charts[ci].data.length; ++i) {
      if (c.charts[ci].data[i].axisYType == "primary") {
        if (c.charts[ci].data[i].axisYIndex > axisYIndex) {
          c.charts[ci].data[i].set('axisYIndex', c.charts[ci].data[i].axisYIndex-1);
        }
      }
    } 
  }

}

function remove_ds(k, cn, dn, frcie) {
  var c = chart_containers.get('chart-'+k+'-container');
  var ci = get_chart_indx_from_name(k, cn) ;
  var di = get_ds_indx_from_name(k, cn, dn) ;
  if (ci>=0 && di >=0) {
    update_axisy(k, ci, di);
    for (var i = 0; i < c.charts[ci].subtitles.length; ++i) {
      if (c.charts[ci].subtitles[i].get('text') == c.charts[ci].data[di].name) {
        c.charts[ci].subtitles[i].remove();
      }
      
    }
    c.charts[ci].data[di].remove();
    
    
    
    
    if (c.charts[ci].data.length <= 0 && frcie) {
      remove_chart(k, cn, frcie);
    }
  }
}

function close_volume_profile_indicator_chart(tk, k,cn, dn) {
	remove_volume_profile_bar_chart(k);
	$('input[id="indicator-chart-k-'+tk+'-c-'+cn+'-d-'+dn+'"]').prop('checked', false);
	$('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+dn+'"]').remove();
}

function close_rsi_indicator_chart(k, cn, dn) {
  remove_ds(k, cn, dn, true);
  remove_chart(k, cn, true);
  $('input[id="indicator-chart-k-'+k+'-c-'+cn+'-d-'+dn+'"]').prop('checked', false);
  /* remove rsi indicator menu */
  $('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+dn+'"]').remove();
}

function close_macd_indicator_chart(k, cn, dn) {
  remove_ds(k, cn, dn, true);
  remove_ds(k, cn, dn+'HISTOGRAM', true);
  remove_ds(k, cn, dn+'SIGNALLINE', true);
  remove_chart(k, cn, true);
  $('input[id="indicator-chart-k-'+k+'-c-'+cn+'-d-'+dn+'"]').prop('checked', false);
}

function close_volume_indicator_chart(k, cn, dn) {
  remove_ema_ds(k, cn, dn, true);
  close_macd_indicator_chart(k, cn+'_MACD_5_8_3', dn+'_MACD_5_8_3');
  close_macd_indicator_chart(k, cn+'_MACD_12_26_9', dn+'_MACD_12_26_9');
  remove_chart(k, cn, true);
  $('input[id="indicator-chart-k-'+k+'-c-'+cn+'-d-'+dn+'"]').prop('checked', false);
  /* remove volume indicator menu */
  $('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+dn+'"]').remove();
}

function close_ticker_chart(k, cn, dn) {
  close_adv_dec_chart(k, dn+'_ADR', dn+'_ADR');
  close_volume_indicator_chart(k, dn + '_Volume', dn + '_Volume');
  close_volume_indicator_chart(k, dn + '_DeliveryVolume', dn + '_DeliveryVolume');
  close_volume_indicator_chart(k, dn + '_DeliveryPercent', dn + '_DeliveryPercent');
  var vp = $('input[id="indicator-chart-k-'+k+'-c-'+dn+'_VolumeProfile-d-'+dn+'_VolumeProfile"]:checked').click();

  var pmap = [1, 2, 3, 5, 8, 9, 10, 11, 12, 13, 14, 20, 21, 26, 34, 50, 55, 89, 100, 144, 200, 233];
  for (var i = 0; i < pmap.length; ++i) {
    close_rsi_indicator_chart(k, dn + '_RSI'+pmap[i], dn + '_RSI'+pmap[i]);
  }

  close_macd_indicator_chart(k, cn+'_MACD_5_8_3', dn+'_MACD_5_8_3');
  close_macd_indicator_chart(k, cn+'_MACD_12_26_9', dn+'_MACD_12_26_9');
  
  remove_ema_ds(k, cn, dn, true);
  remove_ds(k, cn, dn, true);
  $('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+dn+'"]').remove();
}


function get_chart_height_menu_item(k, c, d) {
  var h = '<label for="chart-height-k-'+k+'-c-'+c+'-d-'+d+'"  class="form-label">Chart Height <span class="badge bg-primary" id="chart-height-value-k-'+k+'-c-'+c+'-d-'+d+'">25%</span></label>' +
'<input type="range" class="form-range" id="chart-height-k-'+k+'-c-'+c+'-d-'+d+'" onchange="javascript: manage_chart_height(event)" value="25">';

  return h;
}

function get_macd_ind_menu(k, c, d) {
  // indicator menu
  var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + c +
  '</button>' +
  '<ul class="dropdown-menu">' +
  '<li>'+get_chart_height_menu_item(k, c, d)+'</li>' +
        '<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_macd_indicator_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE</a></li>' +

'</ul>' +
'</div>' +
'</div> &nbsp;';
        
        return h;

}

function get_volume_ind_menu(k, c, d, indv) {
  var mv_583;
  var mv_1226;
  if (indv == 1) {
    mv_583 = 3;
    mv_1226 = 4;
  } else if (indv == 2) {
    mv_583 = 5;
    mv_1226 = 6;
  } else if (indv == 3) {
    mv_583 = 7;
    mv_1226 = 8;
  } 
  // indicator menu
  var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + c +
  '</button>' +
  '<ul class="dropdown-menu">' +
  '<li>'+get_chart_height_menu_item(k, c, d)+'</li>' +
'<li class="dropdown-item">EMA</li>'+
'<li class="dropdown-item">' +
get_ema_html(k, c, d) + '</li>' +
'<li><hr class="dropdown-divider"></li>'+
        get_macd_html(k,c,d,mv_583,mv_1226)+
        '<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_volume_indicator_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE</a></li>' +

'</ul>' +
'</div>' +
'</div> &nbsp;';
        
        return h;

}


function get_rsi_html(k, c, d) {
  
  var h = '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI1-d-'+d+'_RSI1" id="indicator-ds-k-'+k+'-c-'+d+'_RSI1-d-'+d+'_RSI1" value="'+k+','+c+','+d+','+d+'_RSI1'+','+d+'_RSI1,1" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI1-d-'+d+'_RSI1">' +
        '1' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI2-d-'+d+'_RSI2" id="indicator-ds-k-'+k+'-c-'+d+'_RSI2-d-'+d+'_RSI2" value="'+k+','+c+','+d+','+d+'_RSI2'+','+d+'_RSI2,2" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI2-d-'+d+'_RSI2">' +
        '2' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI3-d-'+d+'_RSI3" id="indicator-ds-k-'+k+'-c-'+d+'_RSI3-d-'+d+'_RSI3" value="'+k+','+c+','+d+','+d+'_RSI3'+','+d+'_RSI3,3" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI3-d-'+d+'_RSI3">' +
        '3' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI5-d-'+d+'_RSI5" id="indicator-ds-k-'+k+'-c-'+d+'_RSI5-d-'+d+'_RSI5" value="'+k+','+c+','+d+','+d+'_RSI5'+','+d+'_RSI5,5" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI5-d-'+d+'_RSI5">' +
        '5' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI8-d-'+d+'_RSI8" id="indicator-ds-k-'+k+'-c-'+d+'_RSI8-d-'+d+'_RSI8" value="'+k+','+c+','+d+','+d+'_RSI8'+','+d+'_RSI8,8" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI8-d-'+d+'_RSI8">' +
        '8' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI9-d-'+d+'_RSI9" id="indicator-ds-k-'+k+'-c-'+d+'_RSI9-d-'+d+'_RSI9" value="'+k+','+c+','+d+','+d+'_RSI9'+','+d+'_RSI9,9" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI9-d-'+d+'_RSI9">' +
        '9' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI10-d-'+d+'_RSI10" id="indicator-ds-k-'+k+'-c-'+d+'_RSI10-d-'+d+'_RSI10" value="'+k+','+c+','+d+','+d+'_RSI10'+','+d+'_RSI10,10" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI10-d-'+d+'_RSI10">' +
        '10' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI11-d-'+d+'_RSI11" id="indicator-ds-k-'+k+'-c-'+d+'_RSI11-d-'+d+'_RSI11" value="'+k+','+c+','+d+','+d+'_RSI11'+','+d+'_RSI11,11" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI11-d-'+d+'_RSI11">' +
        '11' +
        '</label>' +
        '</div><li>' +
'<li class="dropdown-item">' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI12-d-'+d+'_RSI12" id="indicator-ds-k-'+k+'-c-'+d+'_RSI12-d-'+d+'_RSI12" value="'+k+','+c+','+d+','+d+'_RSI12'+','+d+'_RSI12,12" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI12-d-'+d+'_RSI12">' +
        '12' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI13-d-'+d+'_RSI13" id="indicator-ds-k-'+k+'-c-'+d+'_RSI13-d-'+d+'_RSI13" value="'+k+','+c+','+d+','+d+'_RSI13'+','+d+'_RSI13,13" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI13-d-'+d+'_RSI13">' +
        '13' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI14-d-'+d+'_RSI14" id="indicator-ds-k-'+k+'-c-'+d+'_RSI14-d-'+d+'_RSI14" value="'+k+','+c+','+d+','+d+'_RSI14'+','+d+'_RSI14,14" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI14-d-'+d+'_RSI14">' +
        '14' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI20-d-'+d+'_RSI20" id="indicator-ds-k-'+k+'-c-'+d+'_RSI20-d-'+d+'_RSI20" value="'+k+','+c+','+d+','+d+'_RSI20'+','+d+'_RSI20,20" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI20-d-'+d+'_RSI20">' +
        '20' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI21-d-'+d+'_RSI21" id="indicator-ds-k-'+k+'-c-'+d+'_RSI21-d-'+d+'_RSI21" value="'+k+','+c+','+d+','+d+'_RSI21'+','+d+'_RSI21,21" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI21-d-'+d+'_RSI21">' +
        '21' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI26-d-'+d+'_RSI26" id="indicator-ds-k-'+k+'-c-'+d+'_RSI26-d-'+d+'_RSI26" value="'+k+','+c+','+d+','+d+'_RSI26'+','+d+'_RSI26,26" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI26-d-'+d+'_RSI26">' +
        '26' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI34-d-'+d+'_RSI34" id="indicator-ds-k-'+k+'-c-'+d+'_RSI34-d-'+d+'_RSI34" value="'+k+','+c+','+d+','+d+'_RSI34'+','+d+'_RSI34,34" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI34-d-'+d+'_RSI34">' +
        '34' +
        '</label>' +
        '</div></li>' +
'<li class="dropdown-item">' +
'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI50-d-'+d+'_RSI50" id="indicator-ds-k-'+k+'-c-'+d+'_RSI50-d-'+d+'_RSI50" value="'+k+','+c+','+d+','+d+'_RSI50'+','+d+'_RSI50,50" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI50-d-'+d+'_RSI50">' +
        '50' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI55-d-'+d+'_RSI55" id="indicator-ds-k-'+k+'-c-'+d+'_RSI55-d-'+d+'_RSI55" value="'+k+','+c+','+d+','+d+'_RSI55'+','+d+'_RSI55,55" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI55-d-'+d+'_RSI55">' +
        '55' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI89-d-'+d+'_RSI89" id="indicator-ds-k-'+k+'-c-'+d+'_RSI89-d-'+d+'_RSI89" value="'+k+','+c+','+d+','+d+'_RSI89'+','+d+'_RSI89,89" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI89-d-'+d+'_RSI89">' +
        '89' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI100-d-'+d+'_RSI100" id="indicator-ds-k-'+k+'-c-'+d+'_RSI100-d-'+d+'_RSI100" value="'+k+','+c+','+d+','+d+'_RSI100'+','+d+'_RSI100,100" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI100-d-'+d+'_RSI100">' +
        '100' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI144-d-'+d+'_RSI144" id="indicator-ds-k-'+k+'-c-'+d+'_RSI144-d-'+d+'_RSI144" value="'+k+','+c+','+d+','+d+'_RSI144'+','+d+'_RSI144,144" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI144-d-'+d+'_RSI144">' +
        '144' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI200-d-'+d+'_RSI200" id="indicator-ds-k-'+k+'-c-'+d+'_RSI200-d-'+d+'_RSI200" value="'+k+','+c+','+d+','+d+'_RSI200'+','+d+'_RSI200,200" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI200-d-'+d+'_RSI200">' +
        '200' +
        '</label>' +
        '</div>' +

'<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+d+'_RSI233-d-'+d+'_RSI233" id="indicator-ds-k-'+k+'-c-'+d+'_RSI233-d-'+d+'_RSI233" value="'+k+','+c+','+d+','+d+'_RSI233'+','+d+'_RSI233,233" onchange="javascript: manage_rsi_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+d+'_RSI233-d-'+d+'_RSI233">' +
        '233' +
        '</label>' +
        '</div>' 

        ;
        
        
        return h;
}

function get_ema_html(k, c, d) {
  
  var h = '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA1" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA1" value="'+k+','+c+','+d+','+d+'_EMA1,1" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA1">' +
        '1' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA2" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA2" value="'+k+','+c+','+d+','+d+'_EMA2,2" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA2">' +
        '2' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA3" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA3" value="'+k+','+c+','+d+','+d+'_EMA3,3" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA3">' +
        '3' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA5" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA5" value="'+k+','+c+','+d+','+d+'_EMA5,5" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA5">' +
        '5' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA8" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA8" value="'+k+','+c+','+d+','+d+'_EMA8,8" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA8">' +
        '8' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA9" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA9" value="'+k+','+c+','+d+','+d+'_EMA9,9" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA9">' +
        '9' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA10" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA10" value="'+k+','+c+','+d+','+d+'_EMA10,10" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA10">' +
        '10' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA11" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA11" value="'+k+','+c+','+d+','+d+'_EMA11,11" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA11">' +
        '11' +
        '</label>' +
        '</div></li>' +
        '<li class="dropdown-item">' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA12" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA12" value="'+k+','+c+','+d+','+d+'_EMA12,12" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA12">' +
        '12' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA13" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA13" value="'+k+','+c+','+d+','+d+'_EMA13,13" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA13">' +
        '13' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA14" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA14" value="'+k+','+c+','+d+','+d+'_EMA14,14" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA14">' +
        '14' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA20" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA20" value="'+k+','+c+','+d+','+d+'_EMA20,20" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA20">' +
        '20' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA21" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA21" value="'+k+','+c+','+d+','+d+'_EMA21,21" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA21">' +
        '21' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA26" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA26" value="'+k+','+c+','+d+','+d+'_EMA26,26" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA26">' +
        '26' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA34" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA34" value="'+k+','+c+','+d+','+d+'_EMA34,34" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA34">' +
        '34' +
        '</label>' +
        '</div>' +
        '</li>' +
        '<li class="dropdown-item">' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA50" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA50" value="'+k+','+c+','+d+','+d+'_EMA50,50" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA50">' +
        '50' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA55" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA55" value="'+k+','+c+','+d+','+d+'_EMA55,55" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA55">' +
        '55' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA89" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA89" value="'+k+','+c+','+d+','+d+'_EMA89,89" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA89">' +
        '89' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA100" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA100" value="'+k+','+c+','+d+','+d+'_EMA100,100" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA100">' +
        '100' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA144" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA144" value="'+k+','+c+','+d+','+d+'_EMA144,144" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA144">' +
        '144' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA200" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA200" value="'+k+','+c+','+d+','+d+'_EMA200,200" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA200">' +
        '200' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA233" id="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA233" value="'+k+','+c+','+d+','+d+'_EMA233,233" onchange="javascript: manage_ema_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-ds-k-'+k+'-c-'+c+'-d-'+d+'_EMA233">' +
        '233' +
        '</label>' +
        '</div>' ;
        
        
        return h;
}


function get_macd_html(k,c,d, v_583, v_12269) {
  var h = '<li class="dropdown-item"><div class="form-check">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD'+'" id="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD_5_8_3'+'" value="'+k+','+d+'_MACD_5_8_3'+','+d+'_MACD_5_8_3'+',MACD_5_8_3,'+v_583+','+c+','+d+'" onchange="javascript: manage_macd_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD_5_8_3'+'">' +
        'MACD - (5, 8, 3)' +
        '</label>' +
        '</div></li>'+
        
        '<li class="dropdown-item"><div class="form-check">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'" id="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'" value="'+k+','+d+'_MACD_12_26_9'+','+d+'_MACD_12_26_9'+',MACD_12_26_9,'+v_12269+','+c+','+d+'" onchange="javascript: manage_macd_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'">' +
        'MACD - (12, 26, 9)' +
        '</label>' +
        '</div></li>';
  
  return h;
}



function get_macd_5_8_3_html(k,c,d, indv) {
  var h = '<li class="dropdown-item"><div class="form-check">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD'+'" id="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD_5_8_3'+'" value="'+k+','+d+'_MACD_5_8_3'+','+d+'_MACD_5_8_3'+',MACD_5_8_3,'+indv+','+c+','+d+'" onchange="javascript: manage_macd_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_MACD_5_8_3-d-'+d+'_MACD_5_8_3'+'">' +
        'MACD - (5, 8, 3)' +
        '</label>' +
        '</div></li>';
  
  return h;
}

function get_macd_12_26_9_html(k,c,d, indv) {
  var h = '<li class="dropdown-item"><div class="form-check">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'" id="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'" value="'+k+','+d+'_MACD_12_26_9'+','+d+'_MACD_12_26_9'+',MACD_12_26_9,'+indv+','+c+','+d+'" onchange="javascript: manage_macd_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_MACD_12_26_9-d-'+d+'_MACD_12_26_9'+'">' +
        'MACD - (12, 26, 9)' +
        '</label>' +
        '</div></li>';
  
  return h;
}




function get_volume_profile_chart_menu(tk,tc,td, k, c, d) {
var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + d +
  '</button>' +
  '<ul class="dropdown-menu">' +
'<li class="dropdown-item"><div class="form-check form-check-inline">' +
          '<input class="form-check-input" type="radio" name="vpchart-type-k-'+k+'-c-'+c+'-d-'+d+'" id="vpchart-atrhl-k-'+k+'-c-'+c+'-d-'+d+'" value="ATRHL" onchange="javascript: onvpcharttypechange('+tk+',\''+tc+'\',\''+td+'\','+k+', \''+c+'\', \''+d+'\', \'ATRHL\');" checked>' +
          '<label class="form-check-label" for="vpchart-atrhl-k-'+k+'-c-'+c+'-d-'+d+'">' +
                'ATR HL' +
          '</label>' +
        '</div></li>' +
'<li class="dropdown-item"><div class="form-check form-check-inline">' +
          '<input class="form-check-input" type="radio" name="vpchart-type-k-'+k+'-c-'+c+'-d-'+d+'" id="vpchart-zonehl-k-'+k+'-c-'+c+'-d-'+d+'" value="ZONEHL" onchange="javascript: onvpcharttypechange('+tk+',\''+tc+'\',\''+td+'\','+k+', \''+c+'\', \''+d+'\', \'ZONEHL\');" >' +
          '<label class="form-check-label" for="vpchart-zonehl-k-'+k+'-c-'+c+'-d-'+d+'">' +
                'ZONE HL' +
          '</label>' +
        '</div></li>' +
'<li class="dropdown-item"><a href="javascript: vp_remove_support_resistance_lines('+tk+',\''+tc+'\',\''+td+'\','+k+', \''+c+'\', \''+d+'\')">Remove Support / Resistance Lines</a></li>' +
'<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_volume_profile_indicator_chart('+tk+','+k+', \''+c+'\', \''+d+'\')">[X] CLOSE THIS CHART</a></li>' +
'</ul>' +
'</div>  &nbsp;';

return h;
}


function get_index_chart_menu_html(k, c, d) {
  
  if (d.startsWith('INDEX.')) {
    var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + d +
  '</button>' +
  '<ul class="dropdown-menu">' +
    get_stock_data_line_type_html(k, c, d) +
    '<li class="dropdown-item">EMA</li>'+
      '<li class="dropdown-item">' +
         get_ema_html(k, c, d) + '</li>' +
'<li><hr class="dropdown-divider"></li>'+
      '<li class="dropdown-item">' +
          get_macd_html(k,c,d,13,14)+ '</li>' +
    get_index_adv_dec_menu_html(k, c, d) + 
    get_index_cum_adv_dec_line_menu_html(k, c, d) +
    '<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_ticker_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE THIS CHART</a></li>' +
'</ul>' +
'</div>  &nbsp;';
return h;
  }
}

function get_stock_data_line_type_html(k, c, d) {
  var h = '<li class="dropdown-item"><div class="form-check form-check-inline">' +
          '<input class="form-check-input" type="radio" name="chart-type-k-'+k+'-c-'+c+'-d-'+d+'" id="chart-candlestick-k-'+k+'-c-'+c+'-d-'+d+'" value="candlestick" onchange="javascript: oncharttypechange('+k+', \''+c+'\', \''+d+'\');">' +
          '<label class="form-check-label" for="chart-candlestick-k-'+k+'-c-'+c+'-d-'+d+'">' +
                'Candlestick' +
          '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
          '<input class="form-check-input" type="radio" name="chart-type-k-'+k+'-c-'+c+'-d-'+d+'" id="chart-ohlc-k-'+k+'-c-'+c+'-d-'+d+'" value="ohlc" onchange="javascript: oncharttypechange('+k+', \''+c+'\', \''+d+'\');" checked>' +
          '<label class="form-check-label" for="chart-ohlc-k-'+k+'-c-'+c+'-d-'+d+'">' +
                'OHLC Bar' +
          '</label>' +
        '</div></li>';
        
        return h;
}

function get_chart_menu(k, c, d) {
  if (d.startsWith('INDEX.')) {
    return get_index_chart_menu_html(k, c, d) ;
  } else {
    return get_stock_chart_menu_html(k, c, d);
  }
}


function get_stock_chart_menu_html(k, c, d) {
var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + d +
  '</button>' +
  '<ul class="dropdown-menu">' +
 get_stock_data_line_type_html(k, c, d) + 
        '<li><hr class="dropdown-divider"></li>'+
        '<li class="dropdown-item">' + 
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_Volume-d-'+d+'_Volume'+'" id="indicator-chart-k-'+k+'-c-'+d+'_Volume-d-'+d+'_Volume'+'" value="'+k+','+d+'_Volume'+','+d+'_Volume'+',Volume,1'+'" onchange="javascript: manage_volume_indicator(this.value, this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_Volume-d-'+d+'_Volume'+'">' +
        'Total Traded Qty' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_DeliveryVolume-d-'+d+'_DeliveryVolume'+'" id="indicator-chart-k-'+k+'-c-'+d+'_DeliveryVolume-d-'+d+'_DeliveryVolume'+'" value="'+k+','+d+'_DeliveryVolume'+','+d+'_DeliveryVolume'+',DeliveryVolume,2'+'" onchange="javascript: manage_volume_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_DeliveryVolume-d-'+d+'_DeliveryVolume'+'">' +
        'Delivery Qty' +
        '</label>' +
        '</div>' +
        '<div class="form-check form-check-inline">' +
        '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_DeliveryPercent-d-'+d+'_DeliveryPercent'+'" id="indicator-chart-k-'+k+'-c-'+d+'_DeliveryPercent-d-'+d+'_DeliveryPercent'+'" value="'+k+','+d+'_DeliveryPercent'+','+d+'_DeliveryPercent'+',DeliveryPercent,3'+'" onchange="javascript: manage_volume_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_DeliveryPercent-d-'+d+'_DeliveryPercent'+'">' +
        'Delivery Percent' +
        '</label>' +
        '</div></li>' +
        '<li class="dropdown-item"><div class="form-check">' + 
                '<input class="form-check-input" type="checkbox" name="indicator-chart-k-'+k+'-c-'+d+'_VolumeProfile-d-'+d+'_VolumeProfile'+'" id="indicator-chart-k-'+k+'-c-'+d+'_VolumeProfile-d-'+d+'_VolumeProfile'+'" value="-1,'+d+'_VolumeProfile'+','+d+'_VolumeProfile'+',VolumeProfile,4,'+k+','+c+','+d+'" onchange="javascript: manage_volume_profile_indicator(this.value,this.checked)">' +
        '<label class="form-check-label" for="indicator-chart-k-'+k+'-c-'+d+'_VolumeProfile-d-'+d+'_VolumeProfile'+'">' +
        'Volume Profile' +
        '</label>' +
        '</div></li>' +
        '<li><hr class="dropdown-divider"></li>'+
        '<li class="dropdown-item">EMA</li><li class="dropdown-item"> ' + 
        get_ema_html(k, c, d) +
        '</li>' +
        '<li><hr class="dropdown-divider"></li>'+
        get_macd_html(k,c,d,1,2)+
        '<li class="dropdown-item">RSI</li><li class="dropdown-item"> ' + 
        get_rsi_html(k, c, d) +
        '</li>' +
'<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_ticker_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE THIS CHART</a></li>' +
'</ul>' +
'</div>  &nbsp;';

return h;

}


function cnencode(t, s) {
  var et = t.replace(/&/g, 'x26').replace(/-/g, 'x2010');
  
  if (Array.isArray(s) && s.length > 0) {
     return et + '_' + s.join('_');
  } else if (s!= undefined && s!= null) {
    return et + '_' + s;
  }
  
  return et;
}

function cndecode(n) {
  var na = n.split('_');
  var et = na[0];
  var t = et.replace(/x26/g, '&').replace(/x2010/g, '-');
  
  return {t: t, s : na.slice(1)};
  
}


function update_chart(k, ts) {

  var c = chart_containers.get('chart-'+k+'-container');

  if (c == null) {
          create_chart_container(k);
          c = chart_containers.get('chart-'+k+'-container');
          if (c==null) { alert('unable to create chart container: ' + 'chart-'+k+'-container :ts: '+ts); return; }
  }
  
  var am = $('input[name=chart-am-k-'+k+']:checked').first().val();
  
  var tf = $('input[name=chart-ds-tf-k-'+k+']:checked').first().val();
   
	populatechart(k, ts+'_'+tf +'_'+ (ngs[k]++ ), am);
}

function get_new_axis_y_obj(t) {
  return {
        title: t,
        prefix: "₹",
        crosshair: {
          enabled: true,
          snapToDataPoint: true
        }
      };
}

function get_new_data_obj(n, t, ayt, ayi) {

  var dobj = {
          name: n,
      		type: t,
      		axisYType: ayt,
          axisYIndex: ayi, 
      		showInLegend: true,
      		legendText: n,
      		dataPoints: []
    	};
      
      return dobj;
}

function get_new_navigator_data_obj() {
  var no = {
        dynamicUpdate: true,
        color: "grey",
        dataPoints : [],
      };
      
      return no;
}

function get_new_chart_obj(k, cn,dn, t) {
  
  var co = null;
  
  if (t === 'ohlc' || t==='candlestick' ) {
    co = {
      title: {
        text: cn,
        fontSize: 0,
        dockInsidePlotArea: true
      },
      subtitles : [{text: dn, fontSize: 12, dockInsidePlotArea: true}],
      toolTip: {
        shared: true
      },
      axisX: {
        lineThickness: 5,
        tickLength: 0,
        labelFormatter: function(e) {
          return "";
        },
        crosshair: {
          enabled: true,
          snapToDataPoint: true,
          labelFormatter: function(e) {
            return ""
          }
        }
      },
      axisY2: {
        title: 'Stock Price',
        prefix: "₹",
        crosshair: {
          enabled: true,
          snapToDataPoint: true
        }
      },
      legend: {
        verticalAlign: "top",
        horizontalAlign: "left",
        itemclick: function (e) {
                console.log("legend click: " + e.dataPointIndex);
                console.log(e);
                if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                } else {
                    e.dataSeries.visible = true;
                }
                e.chart.render();
        },
        dockInsidePlotArea: true
      },
      data: [{
        name: dn,
        showInLegend: true,
        yValueFormatString: "₹#,###.##",
        axisYType: "secondary",
        type: t,
        dataPoints : [],
      }]
    };
  } else if (t == 'column' || t == 'line' || t=='stackedColumn100') {
    co = {
      height: '25%',
      title: {
        text: cn,
        fontSize: 0,
        dockInsidePlotArea: true
      },
      subtitles : [{text: dn, fontSize: 12, dockInsidePlotArea: true}],
      toolTip: {
        shared: true
      },
      axisX: {
        crosshair: {
          enabled: true,
          snapToDataPoint: true
        }
      },
      axisY2: {
        prefix: "",
        title: dn
      },
      legend: {
        horizontalAlign: "left"
      },
      data: [{
        showInLegend: true,
        type: t,
        yValueFormatString: "#,###.##",
        axisYType: "secondary",
        name: dn,
        dataPoints : []
      }]
    };
  } // end if
  
  return co;
  
}

function get_new_chart_container() {
  var id = ngs.length;
  
  ngs.push(0);
  
  return id;
}

/*
function get_new_chart_container() {
  var cea = $('#charts').children();
  
  var ak = [];
  
  for (var i =0; i < cea.length; ++i) {
    //alert(cea[0].id);
    var id = cea[i].id;
    
    var a = id.split('-');
    
    var k = a[1];
    ak.push(k);
    //alert(k);
    
  }
  
  if (ak.length == 0) {
    return 0;
  } else if (ak.length == 1) {
    var k = ak[0];
    
    return Number(k)+1;
  } else {
    var m = Math.max(...ak);
    return m+1;
  }
  
  return 0;
}*/

function create_bar_chart(k, cn , dn, dpa) {
  var chartHTML = '<div class="col" id="chart-'+k+'-col">' +
       '<div id="chart-'+k+'-container"></div>' +
       '</div> <!-- end col -->';
 $('#charts').append(chartHTML);
  
  var chart = new CanvasJS.Chart('chart-'+k+'-container',
        {
          title:{
            text: cn,
            fontSize: 12
          },
          axisY2: {
            title: "Volume",
		titleFontSize: 12,
            fontSize: 12,
		labelFontSize: 12
          }, legend: {dockInsidePlotArea: true},
          data: [
          {
            name: dn,
            type: "bar",
            showInLegend: true,
            legendText: dn,
            color: "gold",
            dataPoints: dpa,
		axisYType: 'secondary',
		axisYIndex: 0
          }
          ]
        });
        chart.render();
        chart_containers.set('chart-'+k+'-container', chart);
}

function create_chart_container(k) {
 var stockChartHTML = '<div class="col" id="chart-'+k+'-col">' +
       '<div id="chart-'+k+'-container" style="height: 100%"></div>' +
       '</div> <!-- end col -->';
 $('#charts').append(stockChartHTML);
 
 var stockChart = new CanvasJS.StockChart("chart-"+k+"-container",{
    exportEnabled: true,
    title:{
      text:'Stock Chart',
      fontSize: 12,
      dockInsidePlotArea: true
    },
    charts: [],
    navigator: {
      enabled: $('#chart-navigator-'+k).prop('checked'),
      data: []
    },rangeSelector: {
      buttonStyle: {
        labelFontSize: 10 //Change it to 16
      },
      inputFields: {
                  style: {
                        fontSize: 10
            }
      }
    }
  });

  chart_containers.set("chart-"+k+"-container", stockChart);
}

function manage_chart_navigator(e) {
  
  var nchkbx = e.target;
  var s = nchkbx.id.split('-');
  var k = s[2];
  
  var c = chart_containers.get("chart-"+k+"-container");
  if (c == null) return;
  c.navigator.set('enabled', nchkbx.checked);
}


function apply_ta(k) {
  $('#ta-'+k+'-prefetch .typeahead').typeahead({
    hint: false,
    highlight: true,
    minLength: 1,
    autocomplete: false
  }, {
    name: 'ticker_symbols',
    source: ticker_symbols
  }).on('typeahead:selected', function ($e, datum) {update_chart(k, datum)} )
    .on('typeahead:autocompleted', function ($e, datum) {update_chart(k, datum)} );
	
}

function onchartamchange(e, k) {
  // do nothing
  var lblId = 'lbl-'+e.target.id;
  
  var lblText = $("#"+lblId).text();
  
  $('#a-mode-btn-'+k).text('☰ '+lblText);
}


function ontfchange(e, k) {
  // do nothing
  var lblId = 'lbl-'+e.target.id;
  
  var lblText = $("#"+lblId).text();
  
  $('#chart-ds-tf-btn-'+k).text('☰ '+lblText);
}



function create_ta(k) {
  var taHTML = '<div class="col" id="ta-'+k+'"><div class="row"><div class="col" >'+
                '<div id="ta-'+k+'-prefetch">'+
                '<input  class="typeahead" placeholder="Search Company symbol"/>'+
                '</div>'+
      '</div>'+
      
            '<div class="col">' +
      '<div class="btn-group" role="group" >' +
    '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="chart-ds-tf-btn-'+k+'">' +
       '☰ 1 Day'+
    '</button>'+
    '<ul class="dropdown-menu">' + 
    '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-ds-tf-k-'+k+'" id="chart-ds-tf-k-'+k+'-1d-D" value="D" onchange="javascript: ontfchange(event, '+k+');" checked>' +
          '<label class="form-check-label" id="lbl-chart-ds-tf-k-'+k+'-1d-D" for="chart-ds-tf-k-'+k+'-1d-D">' +
                '1 Day' +
          '</label>' +
        '</div>' +
      '</li>'+
      
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-ds-tf-k-'+k+'" id="chart-ds-tf-k-'+k+'-1w-W" value="W" onchange="javascript: ontfchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-ds-tf-k-'+k+'-1w-W" for="chart-ds-tf-k-'+k+'-1w-W">' +
                '1 Week' +
          '</label>' +
        '</div>' +
      '</li>'+
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-ds-tf-k-'+k+'" id="chart-ds-tf-k-'+k+'-1m-M" value="M" onchange="javascript: ontfchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-ds-tf-k-'+k+'-1m-M" for="chart-ds-tf-k-'+k+'-1m-M">' +
                '1 Month' +
          '</label>' +
        '</div>' +
      '</li>'+
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-ds-tf-k-'+k+'" id="chart-ds-tf-k-'+k+'-1y-Y" value="Y" onchange="javascript: ontfchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-ds-tf-k-'+k+'-1y-Y" for="chart-ds-tf-k-'+k+'-1y-Y">' +
                '1 Year' +
          '</label>' +
        '</div>' +
      '</li>'+
      '</ul></div></div>' +
      
      
      
      '<div class="col">' +
      '<div class="btn-group" role="group" >' +
    '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="a-mode-btn-'+k+'">' +
       '☰ Analyze One Chart'+
    '</button>'+
    '<ul class="dropdown-menu">' + 
    '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-am-k-'+k+'" id="chart-am-k-'+k+'-a1c-0" value="0" onchange="javascript: onchartamchange(event, '+k+');" checked>' +
          '<label class="form-check-label" id="lbl-chart-am-k-'+k+'-a1c-0" for="chart-am-k-'+k+'-a1c-0">' +
                'Analyze One Chart' +
          '</label>' +
        '</div>' +
      '</li>'+
      
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-am-k-'+k+'" id="chart-am-k-'+k+'-cmpinline-1" value="1" onchange="javascript: onchartamchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-am-k-'+k+'-cmpinline-1" for="chart-am-k-'+k+'-cmpinline-1">' +
                'Compare Inline' +
          '</label>' +
        '</div>' +
      '</li>' +
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-am-k-'+k+'" id="chart-am-k-'+k+'-cmpstacked-2" value="2" onchange="javascript: onchartamchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-am-k-'+k+'-cmpstacked-2" for="chart-am-k-'+k+'-cmpstacked-2">' +
                'Compare Stacked' +
          '</label>' +
        '</div>' +
      '</li>' +
      '<li class="dropdown-item"><div class="form-check">' +
          '<input class="form-check-input" type="radio" name="chart-am-k-'+k+'" id="chart-am-k-'+k+'-cmpsidebyside-3" value="3" onchange="javascript: onchartamchange(event, '+k+');">' +
          '<label class="form-check-label" id="lbl-chart-am-k-'+k+'-cmpsidebyside-3" for="chart-am-k-'+k+'-cmpsidebyside-3">' +
                'Compare Side by Side' +
          '</label>' +
        '</div>' +
      '</li>' +
      '</ul></div></div>' +
      '<div class="col"><div class="form-check form-switch">' +
      '<input class="form-check-input" type="checkbox" role="switch" id="chart-navigator-'+k+'" onchange="javascript: manage_chart_navigator(event)">' +
      '<label class="form-check-label" id="lbl-chart-am-k-'+k+'-cmpinline-1" for="chart-navigator-'+k+'">Navigator</label>' +
      '</div></div>' +
      '<div class="col" id="chart-menu-'+k+'">' +
      
      '</div></div></div>';
  $('#ta').append(taHTML);

     getBloodhoundInstance() ;
     apply_ta(k);

} // end create ta


function getBloodhoundInstance() {
  
  if (ticker_symbols != undefined && ticker_symbols != null) {
    return ticker_symbols;
  }
  
  ticker_symbols = new Bloodhound({
         datumTokenizer: Bloodhound.tokenizers.whitespace,
         queryTokenizer: Bloodhound.tokenizers.whitespace,
         prefetch: 'ticker_symbols.json'
     });
    
      $.get('watchlist.php?qw=fo_symbols',function (ajxdata, status) {
        var a = []
        for (var i = 0; i < ajxdata.length; ++i) {
          a.push(ajxdata[i][0]);
        }
          ticker_symbols.add(a);
        });
        
        return ticker_symbols;
}


function get_first_container() {
  
  var ce = $('#charts').children();
  
  for (var i =0; i < ce.length; ++i) {
    var id = ce[i].id;
    
    var a = id.split('-');
    
    var k = a[1];
    
    if (!isNaN(parseInt(k))) return k;
  }
  
  for (var k = 0; k < ngs.length; ++k) {
    var e = $('#ta-'+k+'-prefetch');
    if (e.length > 0) {
      return k;
    }
  }
  
}


function populate_gm_watchlist(n, dn, nc) {
  $.get('watchlist.php?qw='+n,function (ajxdata, status) {
    var lihtml = null;
    var mhtml = '<div class="btn-group" role="group" >' +
    '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
       dn+
    '</button>'+
    '<ul class="dropdown-menu">';
    for (var i =0; i < ajxdata.length; ++i) {
      var n = ajxdata[i][0];
      lihtml = '<li class="dropdown-item" style="display: inline"><a href="javascript: update_chart(get_first_container(), \'' + n +'\')">'+n+'</a></li>';
      mhtml = mhtml + lihtml; 
      if (i % nc == 0 && i != 0) {
        mhtml += '<li><hr class="dropdown-divider"></li>';
      }     
    }
    mhtml = mhtml + '</ul></div>';
    
    $('#global-menu-col').append(mhtml);
  });
}

function get_adv_dec_menu_html(k, c, d) {
var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + d +
  '</button>' +
  '<ul class="dropdown-menu">' +
        '<li>'+get_chart_height_menu_item(k, c+'line', d+'line')+'</li>' +
        '<li class="dropdown-item">EMA</li><li class="dropdown-item"> ' + 
        get_ema_html(k, c+'line', d+'line') +
        '</li>' +
        '<li><hr class="dropdown-divider"></li>'+
        get_macd_html(k,c+'line',d+'line',9,10)+
        '<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_adv_dec_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE THIS CHART</a></li>' +
'</ul>' +
'</div>  &nbsp;';


return h; 
}

function get_cum_adv_dec_line_menu_html(k, c, d) {
var h = '<div class="btn-group" role="group" id="chart-menu-k-'+k+'-c-'+c+'-d-'+d+'">' +
  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
    ' ☰ ' + d +
  '</button>' +
  '<ul class="dropdown-menu">' +
        '<li>'+get_chart_height_menu_item(k, c+'line', d+'line')+'</li>' +
        '<li class="dropdown-item">EMA</li><li class="dropdown-item"> ' + 
        get_ema_html(k, c+'line', d+'line') +
        '</li>' +
        '<li><hr class="dropdown-divider"></li>'+
        get_macd_html(k,c+'line',d+'line',11,12)+
        '<li class="dropdown-item"><a class="btn btn-primary" role="button" href="javascript: close_adv_dec_chart('+k+', \''+c+'\', \''+d+'\')">[X] CLOSE THIS CHART</a></li>' +
'</ul>' +
'</div>  &nbsp;';


return h; 
}

function get_index_adv_dec_menu_html(k, c, d) {
  
  var h = '<li class="dropdown-item"><div class="form-check">' +
      '<input class="form-check-input" type="checkbox" name="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADR-d-'+d+'_ADR" id="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADR-d-'+d+'_ADR" value="1" onchange="javascript: manage_adv_dec_chart('+k+', \''+d+'_ADR\',\''+d+'_ADR\',\''+d+'\')" />' +
      '<label class="form-check-label" for="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADR-d-'+d+'_ADR">Advance/Decline Ratio</label>'+
      '</div></li>';
      
      return h;
}

function get_index_cum_adv_dec_line_menu_html(k, c, d) {
  
  var h = '<li class="dropdown-item"><div class="form-check">' +
      '<input class="form-check-input" type="checkbox" name="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADL-d-'+d+'_ADL" id="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADL-d-'+d+'_ADL" value="1" onchange="javascript: manage_cum_adv_less_dec_line_chart('+k+', \''+d+'_ADL\',\''+d+'_ADL\',\''+d+'\')" />' +
      '<label class="form-check-label" for="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+c+'_ADL-d-'+d+'_ADL">Advance - Decline Line</label>'+
      '</div></li>';
      
      return h;
}

function manage_adv_dec_chart(k , cn, dn, indv) {

        var e = null;

        if (cn.startsWith('NSEEODADR_D')) {
           e = $('input[id="gm-chart-NSEEODADR_D"]').first();
        } else {

	  e = $('input[id="'+'indicator-chart-ratio-advance-decline-k-'+k+'-c-'+cn+'-d-'+dn+'"]').first();
        }

	if (e.prop('checked') == true) {
	  var c = chart_containers.get('chart-'+k+'-container');

	  if (c == undefined || c == null) {
		create_chart_container(k);
		c = chart_containers.get('chart-'+k+'-container');
		if (c == undefined || c == null) {
			alert('unable to create cart container');
		}
	  }

	  if (c!= undefined && c != null ) {
		  if (c.charts != undefined && c.charts != null) {
			  $.get('ratiochartadvdec.php?qindv='+indv.split('_')[0],function (ajxdata, status) {
				  var co = get_new_chart_obj(k, cn+'line', dn+'line', 'line');
          var coadvdec = get_new_chart_obj(k, cn+'stackedColumn100', dn+'stackedColumn100', 'stackedColumn100');
          coadvdec.data.push(get_new_data_obj(dn, 'stackedColumn100', 'secondary', 0));
          coadvdec.data.push(get_new_data_obj(dn, 'stackedColumn100', 'secondary', 0));
          
				  for (var i = 0; i < ajxdata.length; ++i) {
					  var dp = ajxdata[i][1];
					  var dt = ajxdata[i][0];
            var adv = ajxdata[i][2];
            var dec = ajxdata[i][3];
            var unchanged = ajxdata[i][4];

					  co.data[0].dataPoints.push({x: new Date(dt), y: Number(dp)});
            coadvdec.data[0].dataPoints.push({x: new Date(dt), y: Number(adv), color: 'green'});
            coadvdec.data[1].dataPoints.push({x: new Date(dt), y: Number(dec), color: 'red'});
            coadvdec.data[2].dataPoints.push({x: new Date(dt), y: Number(unchanged), color: 'blue'});
				  }
				  c.addTo('charts', co);
          c.addTo('charts', coadvdec);
          
				$('#chart-menu-'+k).append(get_adv_dec_menu_html(k, cn, dn));

			  });
		  }
	  }
        } else {
		close_adv_dec_chart(k, cn, dn);
	}

}

function manage_cum_adv_less_dec_line_chart(k , cn, dn, indv) {

        var e = null;

        if (cn.startsWith('NSEEODADR_D')) {
           e = $('input[id="gm-chart-NSEEODADR_D_x_ADL"]').first();
        } else {

	  e = $('input[id="'+'indicator-chart-ratio-advance-decline-k-'+k+'-c-'+cn+'-d-'+dn+'"]').first();
        }

	if (e.prop('checked') == true) {
	  var c = chart_containers.get('chart-'+k+'-container');

	  if (c == undefined || c == null) {
		create_chart_container(k);
		c = chart_containers.get('chart-'+k+'-container');
		if (c == undefined || c == null) {
			alert('unable to create cart container');
		}
	  }

	  if (c!= undefined && c != null ) {
		  if (c.charts != undefined && c.charts != null) {
			  $.get('ratiochartcumadvlessdecline.php?qindv='+indv.split('_')[0],function (ajxdata, status) {
				  var co = get_new_chart_obj(k, cn+'line', dn+'line', 'line');
          var coadvdec = get_new_chart_obj(k, cn+'stackedColumn100', dn+'stackedColumn100', 'stackedColumn100');
          coadvdec.data.push(get_new_data_obj(dn, 'stackedColumn100', 'secondary', 0));
          
				  for (var i = 0; i < ajxdata.length; ++i) {
					  var dp = ajxdata[i][1];
					  var dt = ajxdata[i][0];
            var adv = ajxdata[i][2];
            var dec = ajxdata[i][3];

					  co.data[0].dataPoints.push({x: new Date(dt), y: Number(dp)});
            coadvdec.data[0].dataPoints.push({x: new Date(dt), y: Number(adv), color: 'green'});
            coadvdec.data[1].dataPoints.push({x: new Date(dt), y: Number(dec), color: 'red'});
				  }
				  c.addTo('charts', co);
          c.addTo('charts', coadvdec);
          
				$('#chart-menu-'+k).append(get_cum_adv_dec_line_menu_html(k, cn, dn));

			  });
		  }
	  }
        } else {
		close_adv_dec_chart(k, cn, dn);
	}

}



function close_adv_dec_chart(k, cn, dn) {
	remove_chart(k, cn+'line', true);
  remove_chart(k, cn+'stackedColumn100', true);
  $('input[id="'+cn+'"]').prop('checked', false);
  $('input[id="indicator-chart-ratio-advance-decline-k-'+k+'-c-'+cn+'-d-'+dn+'"]').prop('checked', false);
  $('div[id="chart-menu-k-'+k+'-c-'+cn+'-d-'+dn+'"]').remove();
}

$(document).ready( function () {

 create_ta(get_new_chart_container());
 //populate_gm_sensex_30();
 populate_gm_watchlist('sensex_30', 'Sensex 30', 3);
 populate_gm_watchlist('nifty_50', 'NIFTY 50', 5);
 populate_gm_watchlist('nifty_next_50', 'NIFTY NEXT 50', 5);
 populate_gm_watchlist('nifty_100', 'NIFTY 100', 8);
 populate_gm_watchlist('nifty_200', 'NIFTY 200', 13);
  populate_gm_watchlist('nifty_500', 'NIFTY 500', 13);
  populate_gm_watchlist('index_symbols', 'Index', 6);

}); // end jquery doc ready



// end js --> 
</script>  
  
  
  
</head>
<body class="vh-100">
	
<div class="container-fluid vh-100 d-flex flex-column" >
<div class="row">
  <div class="col-2">
    <div class="form-check form-switch">
      <input class="form-check-input" type="checkbox" role="switch" id="charts-toolbar" onchange="javascript: $('#ta').toggle();" checked>
      <label class="form-check-label" for="charts-toolbar">Toolbar</label>
    </div>
  </div>
  <div class="col" id="global-menu-col">
   
  
  <div class="btn-group" role="group" >
    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
       ☰ Layout
    </button>
    <ul class="dropdown-menu">
      <li class="dropdown-item"><div class="form-check form-check-inline"  id="layout_1p">
      <input class="form-check-input" type="radio" name="layout_chartp" value="1" checked />
      <label class="form-check-label" for="layout_1p">[1]</label>
      </div>
      <div class="form-check form-check-inline" id="layout_1p">
      <input class="form-check-input" name="layout_chartp" type="radio" value="2"/>
      <label class="form-check-label" for="layout_1p">[1|1]</label>
      </div><div class="form-check form-check-inline" id="layout_1p">
      <input class="form-check-input" name="layout_chartp" type="radio" value="3"/>
      <label class="form-check-label" for="layout_1p">[1|1|1]</label>
      </div></li>
      <li><hr class="dropdown-divider"></li>
      
      <li class="dropdown-item"><div class="form-check" id="layout_lsb">
      <input class="form-check-input" name="layout_lsb" type="checkbox" value="lsb"/>
      <label class="form-check-label" for="layout_lsb">Left Side Bar</label>
      </div></li>
      <li class="dropdown-item"><div class="form-check" id="layout_rsb">
      <input class="form-check-input" name="layout_rsb" type="checkbox" value="rsb"/>
      <label class="form-check-label" for="layout_rsb">Right Side Bar</label>
      </div></li>
    </ul>
  </div>
 

 <div class="btn-group" role="group" >
    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
       ☰ Charts
    </button>
    <ul class="dropdown-menu"> <li class="dropdown-item">Advance Decline</li>
      <li class="dropdown-item"><div class="form-check">
      <input class="form-check-input" type="checkbox" name="gm-chart-NSEEODADR_D" id="gm-chart-NSEEODADR_D" value="1" onchange="javascript: manage_adv_dec_chart(get_first_container(), 'NSEEODADR_D_'+get_first_container()+'_ADR','NSEEODADR_D_'+get_first_container()+'_ADR','NSEEODADR')" />
      <label class="form-check-label" for="gm-chart-NSEEODADR_D">NSE End of Day Adv./ Dec. Ratio</label>
      </div></li>
      <li class="dropdown-item"><div class="form-check">
      <input class="form-check-input" type="checkbox" name="gm-chart-NSEEODADR_D_x_ADL" id="gm-chart-NSEEODADR_D_x_ADL" value="1" onchange="javascript: manage_cum_adv_less_dec_line_chart(get_first_container(), 'NSEEODADR_D_'+get_first_container()+'_ADL','NSEEODADR_D_'+get_first_container()+'_ADL','NSEEODADR')" />
      <label class="form-check-label" for="gm-chart-NSEEODADR_D_x_ADL">NSE End of Day Adv./ Dec. Line</label>
      </div></li>
    </ul>
  </div> 
  
  </div> <!-- end col -->
</div> <!-- end row -->

<div class="row " id="ta">
  
</div>


  <div class="row" style="flex: 1 0 auto" id="charts" style="background-color: orange">
  </div> <!-- end row -->
</div> <!-- end container-fluid -->
</body>
</html>
