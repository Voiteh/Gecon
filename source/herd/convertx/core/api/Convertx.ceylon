import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	ConvertxException
}
shared interface Convertx {
	shared formal Result|ConvertxException convert<Result>(Anything source, Type<Result> resultType);
}