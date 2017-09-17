# Simple Example of Hot swapping. 

Run `make` to build all targets. 

`dynamiclink` is an executable that dynamically links against libtest. so long as libtest maintains ABI compatibility, it can be changed. Once `dynamiclink` is launched it loads libtest into its address space and the implementation of `test()` cannot be changed. 

`hotswap` uses `dlopen()` and `dlsym()` to call `test()`. Each time it reads input from stdin, it uses the latest implementation of `test()`. To try it out, run `./hotswap` and recompile `libtest.dylib` with a different `test()` implementation. You will see changes reflect immeditately without a recompile.

