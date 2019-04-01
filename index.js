const express = require("express");
const ps = require("./output/Main/index.js");

const port = 3500;
const app = express();

class Usuario {
  constructor(nombre, apellido) {
    this.nombre = nombre;
    this.apellido = apellido;
  }
}

const usuarios = [
  new Usuario("Beatriz", "Carrillo"),
  new Usuario("Alejandro", "Diestro"),
  new Usuario("Daniel", "Alcalde"),
  new Usuario("Clara", "Bermúdez")
];

app.get("/", function(req, res) {
  res.send(ps.mostrarPorRango(usuarios));
});

app.listen(port, () => console.log(`Servidor arrancado en puerto ${port}`));
