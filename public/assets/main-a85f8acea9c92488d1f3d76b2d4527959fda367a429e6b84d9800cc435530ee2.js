$(document).ready(function(){

  $.each($('.carousel-image'), function(index, image){
    resizeToMax(image);
  });
  //CHANGE NUMBER BELOW FOR IMAGE SCROLLING INTERVAL
  $('.carousel').carousel({interval: 1000, wrap: true, pause: null});

  //CHANGE NUMBER BELOW FOR PAGE REFRESH INTERVAL
  var total_items = $('.item').size();
  setInterval(function() { window.location.reload(); }, (total_items * 1000) ); 
});

function resizeToMax(id){
    myImage = new Image() 
    var img = id;
    myImage.src = img.src; 
    if(myImage.width / document.body.clientWidth > myImage.height / document.body.clientHeight){
        img.style.width = "100%";
    } else {
        img.style.height = "100%";
    }
}
;
