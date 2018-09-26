
import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}
shared wired class WiredConverter() satisfies Converter<String,Null>{
	shared actual Null convert(Context context, String source, Type<Null> resultType) => null;
	
	
}