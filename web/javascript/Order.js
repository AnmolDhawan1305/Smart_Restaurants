/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var total=Number(0);
var x=$(".prc");
for(var i=0;i<x.length;i++) total+=Number(x[i].value);
$("input[name=total]").val(total+"");
$(".pl").on("click",function(){
    var i=this.id;
    i=i.substring(2);
    var t=Number($("input[name=t"+i+"]").val());
    $("input[name=t"+i+"]").val(t+1+"");
    //var p=Number($("input[name=p"+i+"]").val());
    var u=Number($("input[name=u"+i+"]").val());
    $("input[name=p"+i+"]").val(u*(t+1)+"");
    total+=u;
    $("input[name=total]").val(total+"");
});

$(".ms").on("click",function(){
    var i=this.id;
    i=i.substring(1);
    //alert(i);
    var t=Number($("input[name=t"+i+"]").val());
   // alert(t);
    if(t>1){
    $("input[name=t"+i+"]").val((t-1)+"");
    //var p=Number($("input[name=p"+i+"]").val());
    var u=Number($("input[name=u"+i+"]").val());
    $("input[name=p"+i+"]").val(u*(t-1)+"");
     total-=u;
    $("input[name=total]").val(total+"");
    }
});