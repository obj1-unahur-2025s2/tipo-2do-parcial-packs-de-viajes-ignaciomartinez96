

class Pack {

    const duracionDias
    const precioBase
    const coordinador

    method duracionDias() = duracionDias
    method precioBase() = precioBase
    method coordinador() = coordinador

    const beneficiosEspeciales = []

    method sumarBeneficio(unBeneficio){
        beneficiosEspeciales.add(unBeneficio)
    }

    method valorFinal(){
       return self.precioBase() + beneficiosEspeciales.filter({b => b.estaVigente()}).sum({b => b.costo()})
    }

}


class PackNacional inherits Pack{

    const provinciaDestino
    const actividades = []

    method provinciaDestino() = provinciaDestino

}


class PackInternacional inherits Pack{

    const paisDestino
    const cantidadEscalas
    const lugarDeInteres

    method paisDestino() = paisDestino
    method cantidadEscalas() = cantidadEscalas
    method lugarDeInteres() = lugarDeInteres

    override method valorFinal(){
        return (super() + super() * 0.2) 
    }
}

class Coordinador{

    var cantidadViajesRealizados
    var estaMotivado
    var aniosExperiencia
    var rol 

    method cambiarRol(nuevoRol){
        rol = nuevoRol
    }

}

class Guia{


}

class AsistenteLogistico {
  
}

class Acompaniante {
  
}

class BeneficioEspecial{

    const tipo
    const costo
    var estaVigente

    method tipo()=tipo
    method costo()=costo
    method estaVigente()=estaVigente 
}