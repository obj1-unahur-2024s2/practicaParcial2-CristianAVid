class Personajes{
  var fuerza 
  var rol
  const property inteligencia


  method potencialOfencivo() = fuerza * 10 + rol.extra()
  method fuerza() = fuerza
  method cambiarDeRoll(unRoll) {
    rol = unRoll
  }
  method roll() = rol
  method esGroso() = self.esInteligente() or self.esGrosoEnSuRol()
  method esInteligente()
  method esGrosoEnSuRol() = rol.esGroso(self)
}

class Orco inherits Personajes{
  override method potencialOfencivo() = super() * 1.1
 override   method esInteligente() = false
}
class Humanos inherits Personajes{

  override method esInteligente() = inteligencia > 50 
}
object gerrero{
  method extra() = 100
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 

}
class Casador{
  const property mascota
  method extra() = mascota.extra()
  method esGroso(unPersonaje) = mascota.eslongeba() 

}
object brujo{
  method esGroso(unPersonaje) = true
  method extra() = 0 
}
class Mascota{
  const property fuerza
  var edad
  const property tieneGarras
    method extra() = 
  if(tieneGarras) fuerza * 2
  else fuerza
  method esGroso() = edad > 10
  method edad() = edad
  method aumentoDeEdad() = edad + 1
  method esLongeba() = edad > 10 
}
class Localidad{
  var ejercito
  
  method potencialDefencivo() = ejercito.potencialTotal() 
  method serOcupada(unEjercito)
  
}
class Aldeas inherits Localidad{
  const property cantidadMaximaDepersonajes
  override method serOcupada(unEjercito) {
    if(unEjercito.size() > cantidadMaximaDepersonajes){
      ejercito = unEjercito.nuevoEjercitoFuerte(10)
    }    
  }
}
class Ciudad inherits Localidad{
  override method potencialDefencivo() = super() + 300 
   override method serOcupada(unEjercito){
    ejercito = unEjercito

  }
}


class Ejercito{
  const property personajes = []
  method potencialTotal() = personajes.sum({p=>p.potencialOfencivo()})
  method invadir(unaLocalidad){
    if(self.puedeTomarLocalidad(unaLocalidad))
 }

 method puedeTomarLocalidad(unaLocalidad) =
 Ejercito.potencialTotal() > Localidad.potencialDefencivo() 

 method nuevoEjercitoFuerte(cant){
  const nuevoEjercito = personajes.sortBy({p1,p2=>p1.potencialOfencivo() >
  p2.potencialOfencivo()}).take(cant)
  personajes.removeAll(nuevoEjercito)
  return  new Ejercito(personajes = nuevoEjercito)
 }
}
