// completar
// completar
// completar
// completar
// completar
class Pack {
  const duracionDias
  const precioBase
  const coordinador
  const beneficiosEspeciales = []
  
  method valorFinal()
  
  method esPremium()
  
  method duracionDias() = duracionDias
  
  method precioBase() = precioBase
  
  method coordinador() = coordinador
  
  method sumarBeneficio(unBeneficio) {
    beneficiosEspeciales.add(unBeneficio)
  }
}

class PackNacional inherits Pack {
  const provinciaDestino
  const actividades = []
  
  method provinciaDestino() = provinciaDestino
  
  override method valorFinal() = self.precioBase() + beneficiosEspeciales.filter(
    { b => b.estaVigente() }
  ).sum({ b => b.costo() })
  
  override method esPremium() = (duracionDias > 10) and coordinador.estaAltamenteCalificado()
}

class PackProvincial inherits PackNacional {
  const ciudadesAVisitar
  
  override method esPremium() = ((actividades.size() > 3) and (ciudadesAVisitar > 5)) and (beneficiosEspeciales.filter(
    { b => b.estaVigente() }
  ) > 3)

  override method valorFinal(){
    return super() + (super() * 0.05)
  }
}

class PackInternacional inherits Pack {
  const paisDestino
  const cantidadEscalas
  const lugarDeInteres
  
  method paisDestino() = paisDestino
  
  method cantidadEscalas() = cantidadEscalas
  
  method lugarDeInteres() = lugarDeInteres
  
  override method valorFinal() {
    const precioTentativo = self.precioBase() + beneficiosEspeciales.filter(
      { b => b.estaVigente() }
    ).sum({ b => b.costo() })
    return precioTentativo + (precioTentativo * 0.2)
  }
  
  override method esPremium() = (self.lugarDeInteres() and (duracionDias > 20)) and (cantidadEscalas < 1)
}

class Coordinador {
  var cantidadViajesRealizados
  var estaMotivado
  var aniosExperiencia
  var rol
  
  method estaAltamenteCalificado() = (cantidadViajesRealizados > 20) and rol.criterioExtra(
    self
  )
  
  method estaMotivado() = estaMotivado
  
  method aniosExperiencia() = aniosExperiencia
}

class Guia {
  method criterioExtra(unCoordinador) = unCoordinador.estaMotivado()
}

class AsistenteLogistico {
  method criterioExtra(unCoordinador) = unCoordinador.aniosExperiencia() >= 3
}

class Acompaniante {
  method criterioExtra(unCoordinador) = true
}

class BeneficioEspecial {
  const tipo
  const costo
  var estaVigente
  
  method tipo() = tipo
  
  method costo() = costo
  
  method estaVigente() = estaVigente
}