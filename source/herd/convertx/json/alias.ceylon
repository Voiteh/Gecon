import ceylon.json{
	Object,Array
}
shared alias JSONValue=>Object|Array|Boolean|Integer|Float|String|Null;
shared class JSONObject({<String->JSONValue>*} values)=>Object(values);
shared class JSONArray({JSONValue*} values) =>Array(values);
