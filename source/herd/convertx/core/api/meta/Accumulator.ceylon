shared interface Accumulator {
	shared formal AccumulationException? accumulate(Targetable targetable,Anything data);
}