var toggle = false;

$(document).ready(function(){
    window.addEventListener('message', function( event ) {       
      if (event.data.action == 'open') {

        $(".head-switch-in").removeClass("selected"); 
        $(".head-switch-out").removeClass("selected");  
        $(".head-switch-in").addClass("selected"); 

        const vehicles = document.getElementById("vehicle-list");
          vehicles.innerHTML = '';

        $.post('https://qp_garage/enable-parkout', JSON.stringify({}));

        toggle = false;

        $('.container').css('display', 'block');        

      } else if (event.data.action == 'add') {
                
        AddCar(event.data.plate,event.data.model);        

      } else {
        $('.container').css('display', 'none');
      }
    });
 
    $( ".close" ).click(function() {
      $(".container").fadeOut();
      $.post('https://qp_garage/escape', JSON.stringify({}));
    }); 

    $( ".head-switch-in" ).click(function() {      
      $(".head-switch-in").removeClass("selected"); 
      $(".head-switch-out").removeClass("selected");  
      $(".head-switch-in").addClass("selected"); 

      const vehicles = document.getElementById("vehicle-list");
        vehicles.innerHTML = '';

      $.post('https://qp_garage/enable-parkout', JSON.stringify({}));

      toggle = false;
    }); 

    $( ".head-switch-out" ).click(function() {     
      $(".head-switch-in").removeClass("selected");  
      $(".head-switch-out").removeClass("selected"); 
      $(".head-switch-out").addClass("selected");   
      
      const vehicles = document.getElementById("vehicle-list");
        vehicles.innerHTML = '';

      $.post('https://qp_garage/enable-parking', JSON.stringify({}));

      toggle = true;
    }); 

    function AddCar(plate,model) {
      $("#vehicle-list").append
      (`
      
      <div class="vehicle" onclick="parkOut('` + plate + `');" data-plate="<br>
      ` + plate + `">
        <div class="vehicle-inner">
            <p class="inner-label-knz">` + model + `<br>
                    `+ plate +`</p>
        </div>
      </div>

      `);
    }
});

function parkOut(plate) {
  if (toggle == false) {
    $('.container').css('display', 'none');
    $.post('https://qp_garage/escape', JSON.stringify({}));
    $.post('https://qp_garage/park-out', JSON.stringify({plate: plate}));
  } else if (toggle == true) {
    $('.container').css('display', 'none');
    $.post('https://qp_garage/escape', JSON.stringify({}));
    $.post('https://qp_garage/park-in', JSON.stringify({plate: plate}));
  }
} 