import cpp
import semmle.code.cpp.dataflow.TaintTracking

class Config extends TaintTracking::Configuration {
	Config() { this = "Simple Data Flow Config" }
	override predicate isSource(DataFlow::Node src) {
		src instanceof DataFlow::UninitializedNode and
		src.asUninitialized().getName() = "a"
	}
	override predicate isSink(DataFlow::Node sink) {
		exists(FunctionCall fc | 
			fc.getAnArgument() = sink.asExpr())
	}
}

from DataFlow::Node va, DataFlow::Node e, Config cfg
where cfg.hasFlow(va, e)
select va, e