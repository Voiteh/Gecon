"""Core API module for the Codamo framework. Provides stable API for transformations of data models. Available transformations:
   - Conversion - Initial entry point for conversion, takes source object and converts it into result type object. 
   Whole flow can be implemented using single Conversion or it can delegate to other transformations. 
   Default implementation of this interface is Converter which should be used for defining Conversion.
   	 	
   Example:
   	 
   	shared class ByteToBooleanConverter() extends Converter<Byte,Boolean,Type<Boolean>>() {
   	
   		shared actual Boolean convert(Delegator delegator, Byte source, Type<Boolean> resultType) {
   	 		value convert = delegator.convert(source, \`Integer\`);
   	 		return delegator.convert(convert, \`Boolean\`);
   		}
   
   	}
   	 
   - Resolvance - Chooses implementation of specific interface, abstract class, or any other type which is ambigous in compile time. 
   The most common use case is selecting collection implementation for interface like List<String>. 
   Should this be LinkedList<String> , or maybe ArrayList<String> ? 
   This is handled by implementaton of Resolvance interface.
   Default implementation of this interface is Resolver which should be used for defining Resolvance.
	   	 	
   Example:
   	  
   		shared class ObjectToMapResolver() extends Resolver<Object,Map<String,Anything>,Type<Map<String,Anything>>>(){
   			shared actual Class<Map<String,Anything>,Nothing> resolve(Delegator delegator, Object type, Type<Map<String,Anything>> outputType) => \`HashMap<String,Anything>\`;
   				 
   			matcher => Matcher{
   				Boolean predicate(Object source, Type<Map<String,Anything>> resultType) => true;
   				Integer priority =0;
   			
   			};		 
   		}
   	 
   - Creation - Creates specific result type object from provided result type and arguments. 
   Creation can be undestood as a constructor / initializer. 
   In cases where conversion is generic and type arguments are not available in compile type it is sometimes usefull to delegate to Creation. 
   Default implementation of this interface is Creator which should be used for defining Creation.
   	 	
   Example:
   	 
   	 	shared class ArrayListCreator() extends Creator<{Anything*},List<>>() {
   	 		shared actual List<> create(Delegator delegator, {Anything*} arguments,Class<List<>> kind) {
   	 		return kind.apply(0, 1.5, arguments);
   	 		}
   	 	
   	 		shared actual Matcher matcher => Matcher{
   	 			Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration==`class ArrayList`;
   	 			Integer priority = 1;
   	 		};
   	 	
   	 	}
   	 
   - Mapping - Maps result type parts to source parts values using Dictionary object. 
   Default implementation of this interface is Mapper, which should be used for defining Mapping. 
   Example usecase is when converting from json to model object and the naming of fields are different in model than in json.
   Example:
   	 	shared class SourceKeyValueMapper()
   	 		extends Mapper<Object,{<String->Anything>*},KeyToValueDictionary>() {
   	 	shared actual KeyToValueDictionary map(Relation<Object,{<String->Anything>*}> relation) {
   	 		value sourceType = type(relation.source);
   	 		value mapping = sourceType.getAttributes<>()
   	 				.filter(filterObjectAndIdentifiableAttributes)
   	 				.map((Attribute<Nothing,Anything,Nothing> attr) => attr.declaration.name -> attr.bind(relation.source).get()
   	 		);
   	 		return KeyToValueDictionary(mapping);
   	 	}
   	 	
   	 	shared actual Matcher matcher => Matcher {
   	 		predicate(Relation<Object,{<String->Anything>*}> source, Class<KeyToValueDictionary,Nothing> resultType) => true;
   	 		priority = 0;
   	 	};
   	 }
   """
by("Wojciech Potiopa")
module herd.gecon.core.api "0" {
	import herd.type.support "0.1.0";
}
