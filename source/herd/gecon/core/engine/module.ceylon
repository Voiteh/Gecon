"""Core engine module for Gecon framework. Provides [[Gecon]] class to be instantiated, as main entry point for executing of transformations. 
   Setup is done via [[herd.gecon.core.engine.configuration::Configuration]] class instance. Use Ceylon builder pattern for readable initiaiation.
   All transformation are provided via [[Provider]] instances. 
   Example:
   	value gecon = Gecon { 
   		provider = AutoProvider{ 
   			transformations = ScopeProvisioning{
   				scopes=[
   				`module herd.gecon.core.transformer`,
   				`module herd.gecon.collection.transformer`
   				`module herd.gecon.json.transformer`
   				];
   			};
   		};
   		configuration = Configuration{
   			logging = Logging(info);
   		};
    	}; 
    Example instance provides all required transformations for generic object conversion, collection conversions, json <-> model conversions. 
    Be aware that defined model must be annotated shared. All attributes must be also annotated shared.
    Until further release it must be also annotated serializable. 
    Example generic model conversion using provided gecon instance:
    
    		shared serializable class SomeModel(shared String one,
    			shared Integer two,
    			shared Float three){}
    		shared serializable class OtherModel(shared Integer one,
    			shared String two,
    			shared Boolean three){}
     		
     		void run(){
     			value someModel = SomeModel("1",2,"1.0"); 
     			assert(is OtherModel result=gecon.transform(someModel,`OtherModel`);
     			assert(result.one==1);
     			assert(result.two=="2");
     			assert(result.three==true);
     		}
     
     For more examples take a look on examples source folder.    
"""


module herd.gecon.core.engine "0.0" {
	import ceylon.collection "1.3.3";
	shared import herd.gecon.core.api "0";
	shared import ceylon.logging "1.3.3";
	import herd.type.support "0.1.0";
}
