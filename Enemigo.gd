extends "res://Personajes/PersonajeBase.gd"

var campo_vision = 20
var rango_mira = 300

onready var objetivo = GlobalPersonajes.get('Jugador')

func _ready():
	GlobalPersonajes.set('NPC', self)
	
func _physics_process(_delta):
	if objetivo_en_vision() and objetivo_en_mira():
		look_at(objetivo.position)
		$AnimationPlayer.play("disparo_metralleta")
		#$Lampara.color = Color(1, 0.25, 0.25)
	else:
		$AnimationPlayer.play("inmovil")
		#$Lampara.color = Color(1, 1, 1)

func objetivo_en_vision():
	var direccion_mira = Vector2(1, 0).rotated(global_rotation)
	var direccion_objetivo = (objetivo.position - global_position).normalized()

	if abs(direccion_objetivo.angle_to(direccion_mira)) < deg2rad(campo_vision):
		return true
	else:
		return false

func objetivo_en_mira():
	var estado_espacio = get_world_2d().direct_space_state
	var resultado = estado_espacio.intersect_ray(global_position, objetivo.global_position, [self], collision_mask)

	var distancia_objetivo = objetivo.global_position.distance_to(global_position)
	var objetivo_en_rango = distancia_objetivo < rango_mira

	if !resultado:
		return false

	if resultado.collider.name == 'Jugador' and objetivo_en_rango:
		return true
	else:
		return false
