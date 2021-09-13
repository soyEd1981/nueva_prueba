extends Node2D

#export (PackedScene) var personaje_seleccionado: PackedScene
#onready var jugador = personaje_seleccionado.instance()
#onready var npc = GlobalPersonajes.get('NPC')

func _ready():
#	print(GlobalPersonajes.NPC.name)
#	jugador.position = Vector2(100, 100)
#	add_child(jugador)
	pass


