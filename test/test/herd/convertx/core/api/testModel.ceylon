import herd.convertx.api.component {
	Converter,
	wired
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
shared wired class WiredConverter() satisfies Converter<String,Null>{
	shared actual Null convert(Context context, String source, Type<Null> resultType) => null;
	
	
}