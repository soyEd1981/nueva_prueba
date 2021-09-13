extends KinematicBody2D

var direccion_movimiento = Vector2()
var objetivo_direccion = Vector2()
var puede_moverse = false
var puede_interactuar = false
var puede_atacar = false

export (int) var velocidad_movimiento
#export (Resource) var datos


