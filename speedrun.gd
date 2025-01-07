extends CanvasLayer

var time = 0.0
var seconds = 0
var miliseconds = 0
var sTime=0
var sSeconds=0
var sMiliseconds=0

func _ready():
	
		
	sTime = loadTime()	
	sSeconds = int(sTime)
	sMiliseconds = int((sTime-sSeconds)*1000)
	$prTime.text = "%02d:%03d" % [sSeconds,sMiliseconds]
	

func _process(delta):
	time += delta
	seconds = int(time)
	miliseconds = int((time-seconds)*1000)	
	$speedrunTime.text = "%02d:%03d" % [seconds,miliseconds]

func saveTime(value):
	if loadTime() > value:
		var save = FileAccess.open("user://score.save", FileAccess.WRITE)
		save.store_var(value)
	
func loadTime():
	if FileAccess.file_exists("user://score.save"):
		var save = FileAccess.open("user://score.save", FileAccess.READ)
		return save.get_var()
	return 0


func _on_win_box_body_entered(body):
	saveTime(time)
	
