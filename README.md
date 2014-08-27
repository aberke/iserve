iserve
===

Fork of <https://github.com/noss/iserve>

Fixed Makefile to actually work and cleaned up, among other things


Run
---

- Run and keep shell open ```$ make run_shell```
- Point your browser to http://localhost:6464/


Learn
---

- Walk through of code: <https://erlangcentral.org/wiki/index.php?title=A_fast_web_server_demonstrating_some_undocumented_Erlang_features>
- Inspect ```iserve_system_app.erl``` and ```iserve_system_cb.erl``` for the source code for this app, and ```iserve_system.app``` for the configuration of it.