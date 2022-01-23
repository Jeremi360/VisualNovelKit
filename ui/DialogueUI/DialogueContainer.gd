extends VBoxContainer

onready var dialog_label : AdvancedTextLabel = $DialogLabel
onready var answer_edit : LineEdit = $AnswerEdit

func _ready():
	Rakugo.connect("say", self, "_on_say")
	Rakugo.connect("ask", self, "_on_ask")
	answer_edit.connect("text_entered", self, "_on_answer_entered")
	Rakugo.connect("step", self, "_on_step")

func _on_say(character, text, parameters):
	show()
	# todo make line below work
	# $DialogLabel.variables = Rakugo.variables
	dialog_label.markup_text = "# %s \n" % character.name  
	dialog_label.markup_text += text

func _on_step():
	hide()

func _on_ask(default_answer, parameters):
	answer_edit.show()
	answer_edit.grab_focus()
	answer_edit.placeholder_text = default_answer

func _on_ask_entered(answer):
	answer_edit.hide()
	answer_edit.placeholder_text = ""
	answer_edit.text = ""
	Rakugo.ask_return(answer)

func _process(delta):
	if Rakugo.is_waiting_step and Input.is_action_just_pressed("ui_accept"):
		Rakugo.do_step()
		

