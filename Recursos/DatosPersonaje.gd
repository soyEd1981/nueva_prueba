extends Resource
class_name DatosPersonaje

export (int) var nivel #nivel del personaje; el mínimo es 1, el máximo es 10
export (int) var experiencia #la experienca total del personaje; influye en el nivel
export (int) var vitalidad #puntos de vida
export (int) var ataque #potencia de ataque: en función de la defensa del objetivo
export (int) var defensa #capacidad de defensa: decrece el ataque del objetivo
export (int) var velocidad #tiempo entre ataques
export (int) var inteligencia #capacidad para resolver acertijos

export (int) var hambre #entre mayor sea, decrece la vitalidad. Se recupera con comida
export (int) var sed #entre mayor sea, decrece la vitalidad. Se recupera con bebida
export (int) var cansancio #al llegar a una cantidad específica, el personaje deja de moverse. Se recupera al dormir

#TODO: definir señales que afecten a los diferentes atributos

export (Texture) var cuerpo

#var datos_personaje: Dictionary = {
#	'nivel': 0, 'experiencia': 0, 'vitalidad': 100, 'ataque': 0, 'defensa': 0, 'velocidad': 0, 'inteligencia': 0,
#	'hambre': 0, 'sed': 0, 'cansancio': 0
#}

func _ready():
	pass
