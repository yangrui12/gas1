/*$(function(){
    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        language:  'zh-CN',                                    //这里需要修改
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        Format: 'Time'
    });
  
});*/
$(function () {
	
	var str = toUtf8(""+$("#distribution-id").data("distribution-id")); 
	$("#code").qrcode({ 
	    render: "table", //table方式 
	    width: 100, //宽度 
	    height:100, //高度 
	    text: str //任意内容 
	}); 
	
    $('#datetimepicker9').datetimepicker({
    	format: "YYYY-MM-D h:mm:ss",
        viewMode: 'days',
        locale: "zh_cn"
    });
});

$(document).ready(function(){
	$("#print").click(function(){
	$(".my_show").printArea();
	});
	}); 

function toUtf8(str) {    
    var out, i, len, c;    
    out = "";    
    len = str.length;    
    for(i = 0; i < len; i++) {    
        c = str.charCodeAt(i);    
        if ((c >= 0x0001) && (c <= 0x007F)) {    
            out += str.charAt(i);    
        } else if (c > 0x07FF) {    
            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));    
            out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));    
            out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));    
        } else {    
            out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));    
            out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));    
        }    
    }    
    return out;    
} 