extends Node
class_name State

## When a state wants to be called, it will call this signal
signal change_state


# What should I do when I begin?
func Enter() -> void:
	pass

# What should I do when I exit?
func Exit() -> void:
	pass
	
# What should I do when I am occuring?
func Process(_delta: float) -> void:
	pass
	
# What should I do when I am occuring fixed?
func Physics_Process(_delta: float) -> void:
	pass
