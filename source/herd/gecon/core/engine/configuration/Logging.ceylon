import ceylon.logging {
	Priority,
	info
}

"Configuration for logger in engine module logic classes"
by("Wojciech Potiopa")
shared class Logging(
		"Priority of logging"
		shared variable Priority priority=info){
	
}