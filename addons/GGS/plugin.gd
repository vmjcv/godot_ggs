tool
extends EditorPlugin


const MainPanel = preload("src/ui/main_panel/uiMainPanel.tscn")

var main_panel_instance


func _enter_tree() -> void:
	add_autoload_singleton("ggsManager", "res://addons/GGS/ggs_manager.gd")
	main_panel_instance = MainPanel.instance()
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	make_visible(false)


func _exit_tree() -> void:
	if main_panel_instance:
		main_panel_instance.queue_free()
	remove_autoload_singleton("ggsManager")


func has_main_screen() -> bool:
	return true


func make_visible(visible) -> void:
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name() -> String:
	return "GameSettings"


func get_plugin_icon() -> Texture:
	return preload("assets/icons/plugin_icon.svg")
