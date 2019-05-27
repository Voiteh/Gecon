import ceylon.json {
	JsonObject
}
import herd.gecon.core.api.transformer {

	Converter,
	Delegator
}
import ceylon.language.meta.model {

	Type
}
"Converts [[JsonObject]] to [[String]] representation"
shared class JsonObjectToStringConverter() extends Converter<JsonObject,String,Type<String>>(){
	shared actual String convert(Delegator delegator, JsonObject source, Type<String> resultType) => source.string;
}