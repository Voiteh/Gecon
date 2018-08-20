import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.meta.support {
	MetaAccumulator
}
import herd.convertx.core.api {
	Context
}

service(`interface Component`)
shared class AcumulatorCreator() satisfies  Creator<MetaAccumulator,Null >{
	shared actual MetaAccumulator create(Context context,Class<MetaAccumulator,Nothing> kind, Null arguments) => MetaAccumulator();
	
}