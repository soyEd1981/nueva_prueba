extends "res://Personajes/NpcDeteccion.gd"

var datos_enemigo = {
	'cuerpo': GlobalExploradorArchivos.obtener_archivos("res://Assets/Topdown Shooter (620 assets)/PNG/Enemigos/")
}
var cuerpo_actual = 0

func _ready():
	GlobalPersonajes.set('Enemigo', self)
	randomize()
	cuerpo_actual = randi() % datos_enemigo['cuerpo'].size()
	$Cuerpo.texture = datos_enemigo['cuerpo'][cuerpo_actual]

func _on_RangoVision_body_entered(body):
	if body.name == 'Jugador' or body.is_in_group('npc'):
		look_at(body.position)
		body.velocidad_movimiento = 500
		$AnimationPlayer.play("disparo_metralleta")

func _on_RangoVision_body_exited(body):
	if body.name == 'Jugador' or body.is_in_group('npc'):
		$AnimationPlayer.play("inmovil")
		#yield(get_tree().create_timer(3), "timeout")
		body.velocidad_movimiento = 200
		


