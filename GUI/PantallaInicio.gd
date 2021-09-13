extends Control

func _ready():
	$Inicio.disabled = true
	$CargarPartida.disabled = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'inicio':
		$Inicio.disabled = false
		$CargarPartida.disabled = false

func _on_Inicio_pressed():
	get_tree().change_scene("res://GUI/PantallaPersonalizacion.tscn")

func _on_CargarPartida_pressed():
	GlobalDatosPersonajes.cargar_juego()
	get_tree().change_scene("res://Prueba.tscn")

