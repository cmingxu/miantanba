function changeCity(cityCode){
    jQuery.cookie("city", cityCode);
    window.location.href="/" + cityCode;
}

$(function(){
   var changeCityTimer = null;
   $('.changeCity').mouseover(function(){
       if(changeCityTimer){
           clearTimeout(changeCityTimer);
       }
        $('.cities').show();
   }).mouseout(function(){
       changeCityTimer = setTimeout(function(){
        $('.cities').hide();
       },300);
   });

});