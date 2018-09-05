import ceylon.collection {
	HashMap
}
shared object testData {
	
	shared MatchingIntersection matchingIntersection = MatchingIntersection({ 1, 2, 3 });
	
	shared TestSimpleModel testSimpleModel = TestSimpleModel(1, "3");
	shared TestOtherSimpleModel testOtherSimpleModel = TestOtherSimpleModel("1", 3);
	
	
	shared Map<String,Integer> concreteStringIntegerMap=HashMap<String,Integer>{
		entries ={
			"one"->1,
			"two"->2
		};
	};
	shared Map<String,Anything> genericStringIntegerMap=concreteStringIntegerMap;

	shared Map<String,Integer?> concreteStringUnionMap =HashMap<String,Integer?>{
		entries={
			"one"-> 1,
			"null"->null
		};
	};
	shared Map<String,Anything> genericStringUnionMap=concreteStringUnionMap;

	
}
