import ceylon.json {
	JsonObject,
	Value
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator
}
import herd.codamo.api.core.dictionary {
	KeyToValueDictionary
}

"Creates [[JsonObject]] out of [[KeyToValueDictionary]]"
by ("Wojciech Potiopa")
shared class JsonObjectCreator() extends Creator<KeyToValueDictionary,JsonObject>() {
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, KeyToValueDictionary arguments) => JsonObject {
		values = arguments.map((String elementKey -> Anything elementItem) {
			if(is Value elementItem){
				return elementKey -> elementItem;
			}else{
				return elementKey -> delegator.convert(elementItem,`Value`);
			}
		});
	};
}
