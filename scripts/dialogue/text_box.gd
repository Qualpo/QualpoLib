@icon("res://addons/QualpoLib/textures/icons/TextBoxIcon.svg")
extends Control
class_name TextBox

#region variables
#region exports
@export_category("Nodes")
@export var label : RichTextLabel
@export var name_label : Label
@export var icon : TextureRect
@export_category("Resources")
@export_subgroup("Dialogue")
@export var dialogue : Dialogue
#endregion

#region text box variables
var cur_line = 0
var cur_choice = 0
var line_finished = true
#endregion
#endregion

signal dialogue_progress
signal dialogue_choice_picked(index:int,choice:int) 
signal dialogue_finished

func start_dialogue(dialogue:Dialogue = self.dialogue):
	self.dialogue = dialogue
	cur_line = 0
	line_finished = true
	progress_dialogue()
	
func progress_dialogue():
	dialogue_progress.emit()
	if cur_line > -1:
		if line_finished:
			line_finished = false
			cur_choice = 0
			var line = dialogue.get_line(cur_line)
			name_label.text = line.get_name()
			label.text = line.get_text()
			await dialogue_progress
			print(cur_choice)
			if line_finished:
				return
			if line is DialogueChoiceLine:
				dialogue_choice_picked.emit(cur_line,cur_choice)
			cur_line = dialogue.get_next_line(cur_line,cur_choice)
			line_finished = true
	else:
		end()
func end():
	dialogue_finished.emit()
	print("done")

func choice_up():
	var line = dialogue.get_line(cur_line)
	if line is DialogueChoiceLine:
		if cur_choice < line.get_choice_amount()-1:
			cur_choice += 1
		else:
			cur_choice = 0
func choice_down():
	var line = dialogue.get_line(cur_line)
	if line is DialogueChoiceLine:
		if cur_choice > 0:
			cur_choice -= 1
		else:
			cur_choice = line.get_choice_amount() -1

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		start_dialogue()
	if event.is_action_pressed("ui_accept"):
		progress_dialogue()
	if event.is_action_pressed("ui_up"):
		choice_up()
	elif event.is_action_pressed("ui_down"):
		choice_down()
