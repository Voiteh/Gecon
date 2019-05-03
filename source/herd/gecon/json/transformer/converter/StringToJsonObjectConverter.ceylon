import herd.gecon.core.api.transformer {
	Converter,
	Delegator
}
import ceylon.json {
	JsonObject,
	parse
}
import ceylon.language.meta.model {
	Type
}

shared class StringToJsonObjectConverter() extends Converter<String,JsonObject>() {
	shared actual JsonObject convert(Delegator delegator, String source, Type<JsonObject> resultType) {
		try {
			value result = parse(source);
			switch (result)
			case (is JsonObject) {
				return result;
			}
			else {
				throw Error(source, resultType,Exception("Can't convert from String to JsonObject"));
			}
		} catch (Exception x) {
			throw Error(source, resultType,x);
		}
	}
}
