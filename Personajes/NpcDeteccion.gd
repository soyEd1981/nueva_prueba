extends "res://Personajes/PersonajeBase.gd"

#enum ESTADOS {MOVIMIENTO, ATACANDO, INTERACTUANDO, HERIDO, MUERTO}
#var estado = ESTADOS.MOVIMIENTO

func _physics_process(delta):
	if $LineaMira.is_colliding():
		look_at($LineaMira.get_collider().position)

#export (int) var campo_vision
#export (int) var rango_mira
#
#onready var objetivo = GlobalPersonajes.get('Jugador')
#
#func _ready():
#	pass
#
#func _physics_process(_delta):
#	if objetivo_en_vision() and objetivo_en_mira() and self.is_in_group('enemigo'):
#		$AnimationPlayer.play("disparo_metralleta")
#		look_at(objetivo.position)
#	elif objetivo_en_vision() and objetivo_en_mira() and self.is_in_group('npc'):
#		$Reaccion.visible = true
#		look_at(objetivo.position)
#	else:
#		$Reaccion.visible = false
#		$AnimationPlayer.play("inmovil")
#
#func objetivo_en_vision():
#	var direccion_mira = Vector2(1, 0).rotated(global_rotation)
#	var direccion_objetivo = (objetivo.position - global_position).normalized()
#
#	if abs(direccion_objetivo.angle_to(direccion_mira)) < deg2rad(campo_vision):
#		return true
#	else:
#		return false
#
#func objetivo_en_mira():
#	var estado_espacio = get_world_2d().direct_space_state
#	var resultado = estado_espacio.intersect_ray(global_position, objetivo.global_position, [self], collision_mask)
#
#	var distancia_objetivo = objetivo.global_position.distance_to(global_position)
#	var objetivo_en_rango = distancia_objetivo < rango_mira
#
#	if !resultado:
#		return false
#
#	if resultado.collider == objetivo and objetivo_en_rango:
#		return true
#	else:
#		return false
