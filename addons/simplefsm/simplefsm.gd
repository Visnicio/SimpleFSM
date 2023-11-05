@tool
extends EditorPlugin


func _enter_tree() -> void:
	ProjectSettings.set_setting("editor/script/templates_search_path", "res://addons/simplefsm/script_templates")
	project_settings_changed.connect(_show_advise)
	pass

func _show_advise() -> void:
	OS.alert('Importing this addons changed the default scripts template path to make it easier to create new States, if this is not desired, you can change it on Project Settings', 'Alert')
	pass
