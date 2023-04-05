const iconEye = document.querySelector('.icon-eye1Registrar');

iconEye.addEventListener('click', function(){
    if(this.nextElementSibling.type === "password"){
        this.nextElementSibling.type = "text";
    }else{
        this.nextElementSibling.type = "password";
    }
})

const iconEye2 = document.querySelector('.icon-eye2Registrar');

iconEye2.addEventListener('click', function(){
    if(this.nextElementSibling.type === "password"){
        this.nextElementSibling.type = "text";
    }else{
        this.nextElementSibling.type = "password";
    }
})