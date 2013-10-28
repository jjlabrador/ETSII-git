  function Valida_pass( form ) {
    var message = '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a>';
    var ok = true;
    if (form.new_password.value != form.repeat_new_password.value) {
      message += '<span>Las contraseñas no coinciden.</span><br/>';
      ok = false;
    }
    message += '</div>';
    if (!ok) {
      $('#alert_placeholder').html(message);
      return false;
    } else {
      return true;
    }
  }

  function change_pass(o) {
    o = typeof o !== 'undefined' ? o : "2";
    var message = '';
    var ok = true;
    if (o == "1") {
      message += '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><span>No se ha podido cambiar la contraseña (datos incorrectos).</span>';
      ok = false;
    } else {
      if (o == "0") {
        message += '<div class="alert alert-success"><a class="close" data-dismiss="alert">×</a><span>Se ha cambiado la contraseña correctamente.</span>';
        ok = false;
      }
    }
    message += '</div>';
    if (!ok) {
      $('#alert_placeholder2').html(message);
    }
  }
  
  function valida_upload() {
    var message = '';
    var filesize;
    if (typeof document.forms[0].file === "undefined" ){
      filesize = 5242880;
    }else{
      filesize = document.forms[0].file.files[0].fileSize;}
    var ok = true;
    if (filesize > 5242880) {
      message += '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><span>El tamaño límite del archivo es de 5 Mb.</span>';
      ok = false;
    }
    message += '</div>';
    if (!ok) {
      $('#alert_placeholder').html(message);
      return false;
    } else {
      return true;
    }
  }

  function Valida_login( opc ) {
    var message = '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a>';
    var ok = true;
    if (opc == "1") {
      message += '<span>La contraseña es incorrecta.</span><br/>';
      ok = false;
    }
    if (opc == "2") {
      message += '<span>El email introducido no está registrado.</span><br/>';
      ok = false;
    }
    if (opc == "3") {
      message += '<span>Se ha generado una nueva contraseña. La recibirá en su correo electrónico.</span><br/>';
      ok = false;
    }
    message += '</div>';
    if (!ok) {
      $('#alert_placeholder').html(message);
      return false;
    } else {
      return true;
    }
  }

  function cambia_color( element ) {
    var texto = /[a-zA-Z]/;
    var num = /[0-9]/;
    var sim = /[^0-9a-zA-Z]/;
    var level = 0;
    if ((texto.test(element.value)) && (element.value.length > 5)) level++;
    if ((num.test(element.value)) && (element.value.length > 5)) level++;
    if ((sim.test(element.value)) && (element.value.length > 5)) level++;
    if (level == 0) {
      element.style.color = "#3a87ad";
      element.style.borderColor = "#3a87ad";
      element.style.WebkitBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3";
      element.style.MozBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3";
      element.style.boxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3";
    }
    if (level == 1) {
      element.style.color = "#b94a48";
      element.style.borderColor = "#953b39";
      element.style.WebkitBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392";
      element.style.MozBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392";
      element.style.boxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392";
    }
    if (level == 2) {
      element.style.color = "#c09853";
      element.style.borderColor = "#a47e3c";
      element.style.WebkitBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e";
      element.style.MozBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e";
      element.style.boxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e";
    }
    if (level == 3) {
      element.style.color = "#468847";
      element.style.borderColor = "#468847";
      element.style.WebkitBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b";
      element.style.MozBoxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b";
      element.style.boxShadow = "inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b";
    }
  }

  function checkEnableSubmit() {
    if ((document.getElementById('pwd').value != "") && (document.getElementById('npwd').value != "") && (document.getElementById('rnpwd').value != "")) // some logic to determine if it is ok to go
      {document.getElementById('confirm').disabled = false;}
    else // in case it was enabled and the user changed their mind
      {document.getElementById('confirm').disabled = true;}
  }

    function checkEnableSend() {
    var elements = document.getElementsByClassName("sms");
    var confirms = document.getElementsByClassName("confirm");
    for (var i=0; i<elements.length; i++){
      if ((elements[i].value != "")) // some logic to determine if it is ok to go
        {confirms[i].disabled = false;}
      else // in case it was enabled and the user changed their mind
        {confirms[i].disabled = true;}
    }
  }
  
  function gravatar() {
    if (document.getElementById('image').disabled == true){
      document.getElementById('image').disabled=false;  
    }else{
      document.getElementById('image').disabled=true;
    }
  }
