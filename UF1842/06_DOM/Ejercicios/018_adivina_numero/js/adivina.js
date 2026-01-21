let aleatorio = Math.floor(Math.random() * 100) + 1;
let intentos = 10;

const adivinar = (e) => {
  e.preventDefault();

  let field_number = document.getElementById("numero");
  let field_intents = document.getElementById("intentos");
  let field_result = document.getElementById("resultado");
  let button_send = document.getElementById("enviar");

  let numero = Number(field_number.value);
  let mensaje = "";

  if (intentos > 1) {
    intentos--;
    field_intents.innerText = intentos.toString();
    if (numero > aleatorio) {
      mensaje = `El ${numero} es mayor que el que hay que adivinar.`;
    } else if (numero < aleatorio) {
      mensaje = `El ${numero} es menor que el que hay que adivinar.`;
    } else {
      mensaje = `Has adivinado el número. Era el ${aleatorio}`;
      field_number.disabled = true;
      button_send.disabled = true;
    }
  } else {
    mensaje = `No quedan intentos, el numero era el ${aleatorio}`;
    field_number.disabled = true;
    button_send.disabled = true;
  }
  field_result.style = "visibility: visible";
  field_result.innerHTML = mensaje;
  field_number.value = "";
  field_number.focus();
};

const reiniciar = () => {
  window.location.reload();
  let field_number = document.getElementById("numero");
  field_number.focus();
};
