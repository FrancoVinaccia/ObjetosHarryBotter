import bots.*
import aceites.*

class Hechizo{
    method sufriConsecuenciasA(hechizado)
    method cumpleRequisito(victima)
}

class HechizoComun inherits Hechizo{
    const cargaADisminuir
    override method cumpleRequisito (victima) = victima.cargaElectrica() > cargaADisminuir
    override method sufriConsecuenciasA(hechizado) = hechizado.disminuirEnergia(cargaADisminuir)
}

object inmobilus inherits HechizoComun (cargaADisminuir = 50){
    override method cumpleRequisito(hechicero) = true
}

object sectumSempra inherits Hechizo{
    override method sufriConsecuenciasA(hechizado) {
        hechizado.cambiarAceite(aceiteSucio)
    }
    override method cumpleRequisito(hechicero) = hechicero.esExperimento()
}

object avadakedabra inherits Hechizo{
    override method sufriConsecuenciasA(hechizado) {
        hechizado.agotarEnergia()
    }
    override method cumpleRequisito(hechicero) = not hechicero.tieneAceitePuro() || hechicero.perteneceACasaPeligrosa()
}