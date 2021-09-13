extends Control

var datos: Dictionary = {
	'cuerpo':GlobalExploradorArchivos.obtener_archivos("res://Assets/Topdown Shooter (620 assets)/PNG/JugadoresNPC/"),
	'vitalidad': GlobalDatosPersonajes.datos_jugador.vitalidad,
	'historias': [
		"""Al guarro lo corrieron porque se madreó a su propio jefe""", 
		"""El 'Bond' se cree un agente secreto, pero no llega ni a ministerial""",
		"""Le dicen el pitufo porque siempre usa el color azul""",
		"""No se me ocurrió otro apodo""",
		"""El don, pos por la edad""",
		"""Al freso le gusta vestir de rojo, no es que sea fresa""",
		"""El Ben Grills nunca ha acampado""",
		"""El walking dead es metalero, ni siquiera conoce la serie""",
		"""Le dicen la naturista sólo porque tiene plantas en su casa""",
		"""La doña, pos por la edad"""
		]
	}

var cuerpo_actual: int = 0
var historia_actual: int = 0

func _ready():
	$CenterContainer/PersonajeBase/Cuerpo.texture = datos['cuerpo'][cuerpo_actual]
	$HistoriaPersonaje/Historia.text = datos['historias'][historia_actual]
	
func _on_OptionButton_item_selected(index):
	cuerpo_actual = index
	historia_actual = index
	$CenterContainer/PersonajeBase/Cuerpo.texture = datos['cuerpo'][cuerpo_actual]
	$HistoriaPersonaje/Historia.text = datos['historias'][historia_actual]
	GlobalDatosPersonajes.guardar_datos_jugador(datos['cuerpo'][cuerpo_actual])

func _on_CrearJugador_pressed():
	GlobalDatosPersonajes.guardar_juego()
	get_tree().change_scene("res://Prueba.tscn")
	

