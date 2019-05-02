shared abstract class Dictionary<out Source=Object,out Result=Anything>(shared {<Source->Result>*} stream) satisfies Map<Source,Result>
		given Source satisfies Object

		{
	
	shared actual Boolean defines(Object key) => stream.map((Source elementKey -> Result elementItem) => elementKey).contains(key);
	
	shared actual Result? get(Object key) => stream.find((Source elementKey -> Result elementItem) => key==elementKey)?.item;
	
	shared actual Iterator<Source->Result> iterator() => stream.iterator();
	shared actual Integer hash => stream.hash;
	
	shared actual Boolean equals(Object that) {
		if (is Dictionary<Source, Result> that) {
			return hash==that.hash;
		}
		else {
			return false;
		}
	}
	
	
	
	
	
	
} 