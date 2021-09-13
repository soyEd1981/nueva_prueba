extends Node

var datos_jugador: Resource = preload("res://Recursos/DatosJugador.tres")

func _ready():
	pass

func guardar_datos_jugador(elemento_seleccionado):
	datos_jugador.cuerpo = elemento_seleccionado
	
func guardar_juego():
	var archivo = File.new()
	if not archivo.file_exists('user://juego_salvado.tres'):
		archivo.open('user://juego_salvado.tres', File.WRITE)
	ResourceSaver.save('user://juego_salvado.tres', datos_jugador)
	archivo.close()
#	var directorio = Directory.new()
#	if not directorio.dir_exists('user://partidas_guardadas'):
#		directorio.make_dir_recursive('user://partidas_guardadas')
#	ResourceSaver.save('user://partidas_guardadas/juego_salvado.tres', datos_jugador)

func cargar_juego():
	var archivo = File.new()
	if not archivo.file_exists('user://juego_salvado.tres'):
		return false
	var juego_cargado = load('user://juego_salvado.tres')
	datos_jugador.cuerpo = juego_cargado.cuerpo
	
#	var directorio = Directory.new()
#	if not directorio.file_exists('user://partidas_guardadas/juego_salvado.tres'):
#		return false
		
	#var juego_cargado = load('user://partidas_guardadas/juego_salvado.tres')
	#datos_jugador.cuerpo = juego_cargado.cuerpo
	
	
	
	
