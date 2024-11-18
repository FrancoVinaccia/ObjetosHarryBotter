import aceites.*
import bots.*

class Casa {
    const estudiantes = []
    method cantAceitePuro() = estudiantes.count { estudiante => estudiante.tieneAceitePuro() }
    method cantAceiteSucio() = estudiantes.count { estudiante => not estudiante.tieneAceitePuro() }

    method esPeligrosa() = self.cantAceitePuro() < self.cantAceiteSucio()
}

object gryffindor inherits Casa{
    override method esPeligrosa() = false
}
object slytherin inherits Casa{
    override method esPeligrosa() = true
}
object hufflepuff inherits Casa{
}
object ravenclaw inherits Casa{
}