extends Timer

var time: float = 100

func _ready() -> void:
	timeout.connect(pizzaface_spawn)

func _process(_delta: float) -> void:
	time = wait_time

func pizzaface_spawn() -> void:
	stop()
	GlobalSignals.emit_signal("timesup")
