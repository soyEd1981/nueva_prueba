extends TouchScreenButton

var radio = Vector2(48, 48)
var limite = 80
var arrastre_continuo = -1
var aceleracion_retorno = 20
var umbral = 10

#func _ready():
#	pass

func _process(delta):
	if arrastre_continuo == -1:
		var diferencia_posicion = (Vector2(0, 0) - radio) - position
		position += diferencia_posicion * aceleracion_retorno * delta

func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		var distancia_desde_centro = (event.position - get_parent().global_position).length()
		if distancia_desde_centro <= limite * global_scale.x or event.get_index() == arrastre_continuo:
			global_position = (event.position - radio + global_scale)
			if obtener_posicion_boton().length() > limite:
				position = obtener_posicion_boton().normalized() * limite - radio
			arrastre_continuo = event.get_index()
	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == arrastre_continuo:
		arrastre_continuo = -1

func obtener_posicion_boton():
	return position + radio 

func obtener_valor():
	if obtener_posicion_boton().length() > umbral:
		return obtener_posicion_boton().normalized()
	return Vector2(0, 0)

