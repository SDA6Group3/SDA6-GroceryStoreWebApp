// Form validation code will come here.
function validate() {
      
    if( document.myForm.FirstName.value == "" ) {
       alert( "Please provide your first name!" );
       document.myForm.FirstName.focus() ;
       return false;
    }

    if( document.myForm.LastName.value == "" ) {
        alert( "Please provide your first name!" );
        document.myForm.LastName.focus() ;
        return false;
     }

     if( document.myForm.Phone.value == "" ) {
        alert( "Please provide your Phone Number!" );
        document.myForm.Phone.focus() ;
        return false;
     }

    if( document.myForm.Zip.value == "" || isNaN( document.myForm.Zip.value ) ||
     document.myForm.Zip.value.length != 5 ) {
     
     alert( "Please provide a zip in the format #####." );
     document.myForm.Zip.focus() ;
     return false;
    }

    if( document.myForm.Country.value == "-1" ) {
     alert( "Please provide your country!" );
     return false;
   }

    if( document.myForm.EMail.value == "" ) {
       alert( "Please provide your Email!" );
       document.myForm.EMail.focus() ;
       return false;
    }
 
 //Password validation 
  if(document.myForm.pwd1.value != "" && document.myForm.pwd1.value == document.myForm.pwd2.value) {
    if(document.myForm.pwd1.value.length < 6) {
      alert("Error: Password must contain at least six characters!");
      document.myForm.pwd1.focus() ;
      return false;
    }
    if(document.myForm.pwd1.value == document.myForm.EMail.value) {
      alert("Error: Password must be different from Username!");
      document.myForm.pwd1.focus() ;
      return false;
    }
    re = /[0-9]/;
    if(!re.test(document.myForm.pwd1.value)) {
      alert("Error: password must contain at least one number (0-9)!");
      document.myForm.pwd1.focus() ;
      return false;
    }
    re = /[a-z]/;
    if(!re.test(document.myForm.pwd1.value)) {
      alert("Error: password must contain at least one lowercase letter (a-z)!");
      document.myForm.pwd1.focus() ;
      return false;
    }
    re = /[A-Z]/;
    if(!re.test(document.myForm.pwd1.value)) {
      alert("Error: password must contain at least one uppercase letter (A-Z)!");
      document.myForm.pwd1.focus() ;
      return false;
    }
  } else {
    alert("Error: Please check that you've entered and confirmed your password!");
    document.myForm.pwd1.focus() ;
    return false;
  }

}

$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
    var $this = $(this),
        label = $this.prev('label');
   
        if (e.type === 'keyup') {
          if ($this.val() === '') {
            label.removeClass('active highlight');
          } else {
            label.addClass('active highlight');
          }
      } else if (e.type === 'blur') {
          if( $this.val() === '' ) {
          label.removeClass('active highlight'); 
          } else {
          label.removeClass('highlight');   
          }   
      } else if (e.type === 'focus') {
        
        if( $this.val() === '' ) {
          label.removeClass('highlight'); 
          } 
        else if( $this.val() !== '' ) {
          label.addClass('highlight');
          }
      }
   
  });
   
  $('.tab a').on('click', function (e) {
    
    e.preventDefault();
    
    $(this).parent().addClass('active');
    $(this).parent().siblings().removeClass('active');
    
    target = $(this).attr('href');
   
    $('.tab-content > div').not(target).hide();
    
    $(target).fadeIn(600);
    
  });