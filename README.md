<center>
<img src="addons/simplefsm/git_repo_misc/logo_large.png" width="600">
</center>

# Installing

 1. Download the .zip file and extract the addons folder to your root project folder `res://`
 2. Enable the addon by ticking the enable checkbox at Project -> Project Settings -> addons

# About
This is a simple barebones FSM project, it contains a FSM brain and State class so you can focus on building your states and logic.

The state machine is *not* limited to player nor enemy logic, it's parent agnostic, meaning that you have to define manually the component that its gonna alter, here a quick example of a Idle state for a CharacterBody3D (player):

``` gdscript
extends State
class_name player_idle

@export var player_character: CharacterBody3D
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func Physics_Process(_delta: float) -> void:
	if !player_character.is_on_floor():
		change_state.emit(self, "player_falling")
		pass
	
	if Input.is_action_just_pressed("backward") or Input.is_action_just_pressed("forward") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		change_state.emit(self, "player_moving")
	
	player_character.velocity.x = 0
	player_character.velocity.z = 0
	
	player_character.move_and_slide()
	pass
```
## Creating a new State
![Example of creating a state gif](addons/simplefsm/git_repo_misc/creating_new_state.gif)

## Changing States
To change between states is simple as calling the `change_state` signal, it takes two arguments, the state emmiting the signal and the desired state:
``` gdscript
change_state.emit(self, "your_new_state")
```