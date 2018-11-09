/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var c=window.location.href;
c=c.substr(c.indexOf("?")+1); 
var temp=$(".sr");
for(var i=0;i<temp.length;i++) temp[i].value=i+1+"."; 
var total=Number(0);
var x=$(".prc");
for(var i=0;i<x.length;i++) total+=Number(x[i].value);
$("input[name=total]").val(total+"");
$(".pl").on("click",function(){
    var i=this.id;
    i=i.substring(2);
    var t=Number($("form input[name=t"+i+"]").val());
  if(t<Number($("input[type=hidden][name=h"+i+"]").val())){
    $("form input[name=t"+i+"]").val(t+1+"");
    //var p=Number($("input[name=p"+i+"]").val());
    var u=Number($("form input[name=u"+i+"]").val());
    $("form input[name=p"+i+"]").val(u*(t+1)+"");
    total+=u;
    $("input[name=total]").val(total+"");
    }
    else alert('You have reached max limit of available qty of this item.');
});

$(".ms").on("click",function(){
    var i=this.id;
    i=i.substring(1);
    //alert(i);
    var t=Number($("form input[name=t"+i+"]").val());
   // alert(t);
    if(t>1){
    $("form input[name=t"+i+"]").val((t-1)+"");
    var u=Number($("form input[name=u"+i+"]").val());
    $("form input[name=p"+i+"]").val(u*(t-1)+"");
     total-=u;
    $("input[name=total]").val(total+"");
    }
});
$("input[type=checkbox]").on("click",function(){
   var i=this.name;
   i=i.substring(1);
   //alert(i);
   var pr=String(prompt("Do you want to remove this item?"));
   if(pr.toLowerCase().indexOf("yes")>=0){
   total-=$("input[name=p"+i+"]").val();
   $("input[name=total]").val(total+"");
   $("#r"+i).remove();
   fun();
   c=c.replace(i+"=1&","");
   }
   else $("input[name=c"+i+"]").prop("checked",true);
  
});
function fun(){
   var tempf=$(".sr");
for(var i=0;i<tempf.length;i++) tempf[i].value=i+1+"."; 
}
$(".btn-warning").click(function(){
    window.location.href="index.html";
});
$("#submit").click(function(){
    document.forms[0].submit();
});
$('#add').click(function(){ 
    
    window.location.href='Menu.jsp?'+c;
    
});

