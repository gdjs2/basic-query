import cpp
import semmle.code.cpp.controlflow.ControlFlowGraph

from ControlFlowNode cfg
select cfg, "is a control flow graph node."