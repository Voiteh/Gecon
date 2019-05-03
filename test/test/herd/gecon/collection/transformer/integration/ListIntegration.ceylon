import ceylon.collection {
	MutableList
}
import ceylon.test {
	test
}
shared class ListIntegration() extends CollectionIntegration(){
	shared test 
	void shouldConvertIterableToArrayList(){
		assert(is MutableList<String> result=gecon.convert({1,2,3},`MutableList<String>`)); 
		assert(result.containsEvery({"1","2","3"}));
	}
	
}