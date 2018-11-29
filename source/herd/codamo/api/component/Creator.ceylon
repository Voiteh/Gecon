import herd.codamo.api.operation {
	Creation
}

"Creates a type out of provided class and arguments, required for creation. This is suppport API used strictly for creation"
by("Wojciech Potiopa")
shared interface Creator<Args,Result> satisfies  Creation<Args,Result,Result> {}


