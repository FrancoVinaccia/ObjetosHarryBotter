import bots.*

class GrupoEstudiantes{
  const estudiantes = []

  method llegadaGrupoAHogwarts() {
    estudiantes.forEach { estudiante => botSombreroSeleccionador.asignarCasaA(estudiante) }
  }

  method asistenMateria(materia) {
    estudiantes.forEach { estudiante => estudiante.asistirMateria(materia) }
  }
}