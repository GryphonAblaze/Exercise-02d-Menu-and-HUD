extends Node

var score = 0
var time = 0
var lives = 0
var VP = null

func reset():
	score = 0
	time = 30
	lives = 5

func _ready():
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed",self,"resize")
	reset()
 
func _resize():
	VP = get_viewport().size
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_lives()
func update_score(s):
	score += s
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()
func update_lives(l):
	lives += l
	if lives < 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	else:
		var HUD = get_node_or_null("/root/Game/UI/HUD")
		if HUD != null:
			HUD.update_lives() 
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
