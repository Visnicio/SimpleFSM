extends Node
class_name simple_fsm_brain

## A colletion of all states this state machine contains
var states : Dictionary = {}
var current_state : State
@export var initial_state: State

func _ready() -> void:
	_prepare_states()
	
	# If there is a initial state, it calls it and set as current_state of the FSM
	if initial_state:
		initial_state.Enter()
		current_state = initial_state


## Setup the states of this brain based on the children
func _prepare_states() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.change_state.connect(_on_state_changed)
	pass

func _process(delta: float) -> void:
	# process the current state if available
	if current_state:
		current_state.Process(delta)

func _physics_process(delta: float) -> void:
	# process the current state if available
	if current_state:
		current_state.Physics_Process(delta)
	pass

# Handles the change_state logic
func _on_state_changed(state : State, new_state_name : String) -> void:
	if state != current_state: # if the state trying to change is the same state, it returns the function
		return
	
	var new_state : State = states.get(new_state_name.to_lower())
	if !new_state: # If the new_state is not found
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
	pass
