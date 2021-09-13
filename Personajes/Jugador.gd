extends "res://Personajes/NpcDeteccion.gd"

var punto_muerto = 0.3
onready var joystick = owner.get_node("GUI/Mando/TouchScreenButton")
onready var boton_interaccion = owner.get_node("GUI/BotonInteraccion")

func _ready():
	GlobalPersonajes.set('Jugador', self)
	$Cuerpo.texture = GlobalDatosPersonajes.datos_jugador.cuerpo
	velocidad_movimiento = 200

func _physics_process(delta):
	move_and_slide(joystick.obtener_valor() * velocidad_movimiento)
	if joystick.obtener_valor().length() >= punto_muerto:
		rotation = joystick.obtener_valor().angle()

func _on_RangoVision_body_entered(body):
	if body.is_in_group('enemigo'):
		puede_atacar = true

func _on_RangoVision_body_exited(body):
	if body.is_in_group('enemigo'):
		puede_atacar = false
		
func _on_BotonInteraccion_pressed():
	if puede_atacar:
		$AnimationPlayer.play("disparo_pistola")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'disparo_pistola':
		$AnimationPlayer.play("inmovil")













