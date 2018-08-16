import herd.convertx.json {
	JSONObject,
	JSONArray
}
import herd.convertx.core {
	Convertx
}

shared {[Convertx, JSONObject, SimpleModel]*} simpleModelParams = { [
		testData.jsonConvertx,
		testData.simpleModelJSONObject,
		testData.simpleModel
	] };
shared {[Convertx, JSONArray, {Object*}]*} simpleStreamParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArray,
		testData.simpleStream
	] };
shared {[Convertx, JSONArray, [Object*]]*} simpleSequnceParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArray,
		testData.simpleSequence
	] };
shared {[Convertx, JSONArray, [String, Integer]]*} simpleTupleParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArray,
		testData.simpleTuple
	] };
shared {[Convertx, JSONArray, Array<Anything>]*} simpleArrayWithNullParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArrayWithNull,
		testData.simpleArrayWithNull
	] };
shared {[Convertx, JSONArray, List<Anything>]*} simpleListWithNullParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArrayWithNull,
		testData.simpleListWithNull
	] };

shared {[Convertx, JSONArray, Set<Object>]*} simpleSetParams = { [
		testData.jsonConvertx,
		testData.simpleJSONArray,
		testData.simpleSet
	] };

shared {[Convertx, JSONObject, TypeResolveInterface]*} typeResolveOneParams = { [
		testData.jsonConvertx,
		testData.resolveOneJSONObject,
		testData.resolveOne
	] };
shared {[Convertx, JSONObject, TypeResolveInterface]*} typeResolveTwoParams = { [
		testData.jsonConvertx,
		testData.resolveTwoJSONObject,
		testData.resolveTwo
	] };

shared {[Convertx, JSONObject, ResolvableClass]*} typeResolvableParams = { [
		testData.jsonConvertx,
		testData.resolvableJSONObject,
		testData.resolvable
	] };
