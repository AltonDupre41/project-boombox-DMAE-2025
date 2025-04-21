extends Node2D

<<<<<<< HEAD
@export var dialogSignal = "1"

func _ready() -> void:
	if dialogSignal != "-1":
		JavaScriptBridge.eval("console.log(\"Dialouge Sent!\");",true)
		JavaScriptBridge.eval(str("triggerDialogue(",dialogSignal,")"),true)
		
		
=======
@export var dialogSignal = "1"  # Set to "1" to trigger the tutorial dialogue

func _ready() -> void:
	if dialogSignal != "-1":
		# Add more robust JavaScript call with error handling and logging
		var js_code = """
		console.log('Room.gd is attempting to trigger dialogue ID: """ + dialogSignal + """');
		
		if (typeof window.triggerDialogue === 'function') {
			try {
				window.triggerDialogue(""" + dialogSignal + """);
				console.log('Successfully called triggerDialogue with ID """ + dialogSignal + """');
			} catch (error) {
				console.error('Error calling triggerDialogue:', error);
			}
		} else {
			console.error('triggerDialogue function is not available in the global scope');
			console.log('Available global functions:', Object.keys(window).filter(key => typeof window[key] === 'function'));
		}
		"""
		
		JavaScriptBridge.eval(js_code, true)
>>>>>>> 23ca8fecba012f4ced7b7b3d9d0400a5d7f5751e
