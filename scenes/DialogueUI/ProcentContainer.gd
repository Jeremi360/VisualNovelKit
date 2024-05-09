@tool
extends Control

## This is simple class that set Control minimal_size base on root size procent
class_name ProcentControl

## Node that which size will be used as 100 procent
@export var root : Control

## Set it from 1 to 100
## It chaning this works only in Editor
@export var procent_size := Vector2(100, 100):
	set(value):
		if Engine.is_editor_hint():
			procent_size = value
			custom_minimum_size = root.size * (procent_size / 100.0)
		else:
			push_warning("Changing procent_size works only inside Editor")
	
	get: return procent_size