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
shared class JsonObjectToStringConverter() extends Converter<JsonObject,String>(){
	shared actual String convert(Delegator delegator, JsonObject source, Type<String> resultType) => source.string;
}