const form = document.getElementById('form');
const usuario = document.getElementById('username');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');
const parrafo = document.getElementById('warnings');

form.addEventListener('submit', e => {
    e.preventDefault();
    let warnings = "";
    let entrar = false;
    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    parrafo.innerHTML = "";
    if (usuario.value.length <6){
        warnings += 'El nombre no es valido <br>';
    }
    if(!regexEmail.test(email.value)){
        warnings += 'El email no es valido <br>';
        entrar = true;
    }
    if(password.value.length <8){
        warnings += 'La contraseña no es valida<br>';
        entrar = true;
    }
    if(password2.value.length <8){
        warnings += 'Confirmar contrseña';
        entrar = true;   
    }else if(password2.value!==password.value){
        warnings += 'La contraseña no conincide';
        entrar = true; 
    }else{
        parrafo.innerHTML = "Enviado";
    }
    if(entrar){
        parrafo.innerHTML = warnings;
    }else{
        parrafo.innerHTML = "Enviado";
    }
}); 
