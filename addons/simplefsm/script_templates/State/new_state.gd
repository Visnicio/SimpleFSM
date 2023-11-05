extends State
class_name change_to_state_name

# What should I do when I begin?
func Enter() -> void:
	pass

# What should I do when I exit?
func Exit() -> void:
	pass
	
# What should I do when I am occuring?
func Process(_delta: float) -> void:
	pass
	
# What should I do when I am occuring (better for kinematic movement such as move_and_slide())*?
func Physics_Process(_delta: float) -> void:
	pass
