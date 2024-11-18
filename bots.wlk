import hechizos.*
import casas.*
import aceites.*
import materias.*


class Bot {
  var property cargaElectrica
  var property tipoAceite

  method estaActivo () {
    cargaElectrica > 0
  }
  method tieneAceitePuro() = tipoAceite.pureza()
  method diminuirEnergia(disminuyente) {cargaElectrica -= disminuyente}
  method cambiarAceite (nuevoAceite) {tipoAceite = nuevoAceite}
  method agotarEnergia() {cargaElectrica = 0}
}

class BotMago inherits Bot {
  const hechizos = []
  var casa
  method asignarCasa(casaAsignada) {casa = casaAsignada}

  method esExperimentado () = hechizos.size() > 3 and cargaElectrica > 50
}

class BotEstudiante inherits BotMago {
  method asistirMateri2a(hechizo){
    hechizos.add(hechizo)
  }

  method asistirMateria(materia){
    self.aprender(materia.hechizoEnseniado())
  }

  method aprender(hechizo){
    hechizos.add(hechizo)
  }

  method lanzarHechizo (hechizo,victima){
    if(hechizo.cumpleRequisito(victima)){
      hechizo.sufriConsecuenciasA(victima)
    }
  }
}

class BotProfesor inherits BotMago{
  const materiasDictadasCant

  override method esExperimentado () = super() and materiasDictadasCant >= 2
  override method diminuirEnergia(disminuyente) {}
  override method agotarEnergia() {cargaElectrica /= 2}
}

object botSombreroSeleccionador inherits Bot (cargaElectrica = 100, tipoAceite = aceitePuro) {
  const casas = [gryffindor, slytherin, hufflepuff, ravenclaw]
  var indiceActual = 0

  override method cambiarAceite(nuevoAceite) {}

  method asignarCasaA(estudiante) {
    estudiante.asignarCasa(casas.get(indiceActual))

    indiceActual = (indiceActual + 1) % casas.size()
  }
}