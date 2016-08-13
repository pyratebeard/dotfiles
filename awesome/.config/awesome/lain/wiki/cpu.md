[<- widgets](https://github.com/copycat-killer/lain/wiki/Widgets)

Shows in a textbox the current CPU usage, both in general and per core.

	mycpuusage = lain.widgets.cpu()

### input table

Variable | Meaning | Type | Default
--- | --- | --- | ---
`timeout` | Refresh timeout seconds | int | 2
`settings` | User settings | function | empty function

`settings` can use these strings:

* `cpu_now.usage`, the general use percentage;
* `cpu_now[i].usage`, the i-th core use percentage, with `i` starting from 1.

### output

A textbox.
