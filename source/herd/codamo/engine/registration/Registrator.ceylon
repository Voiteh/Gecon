
import herd.codamo.api.core.transformer {
	Transformation
}

"Registrator interface allows registereing of [[Transformation]]s"
shared interface Registrator {
	
	shared formal void register(Transformation.Flatter visitor,Registry registry,Transformation[] operations);
	
}