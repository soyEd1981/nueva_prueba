extends "res://Personajes/NpcDeteccion.gd"

var datos_npc = {
	'cuerpo': GlobalExploradorArchivos.obtener_archivos("res://Assets/Topdown Shooter (620 assets)/PNG/JugadoresNPC/")
}
var cuerpo_actual = 0

func _ready():
	GlobalPersonajes.set('NPC', self)
	randomize()
	cuerpo_actual = randi() % datos_npc['cuerpo'].size()
	$Cuerpo.texture = datos_npc['cuerpo'][cuerpo_actual]

func _on_RangoVision_body_entered(body):
	if body.name == 'Jugador':
		look_at(body.position)
		$Reaccion.visible = true
		
func _on_RangoVision_body_exited(body):
	if body.name == 'Jugador':
		$AnimationPlayer.play("inmovil")
		$Reaccion.visible = false
