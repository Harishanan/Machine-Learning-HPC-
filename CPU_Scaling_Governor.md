# CPU Scaling Governor Management Script
This bash script provides a straightforward interface for managing CPU scaling governors on Linux systems. It allows users to display the current CPU scaling governor for each CPU and change the governor to one of the available options.

## Key Features
- Display the current CPU scaling governor for each CPU.
- Change the CPU scaling governor to one of the following options:
  - performance
  - powersave
  - ondemand
  - userspace
  - conservative
  - schedutil

## How to Use
1. Run the script in a terminal by doing (The script can be found [here](cpuGovernor.sh)):
   
```sh
./cpuGovernor

```
2. Choose one of the two options:
   - 1 to show the current CPU Scaling Governor.
   - 2 to change the CPU Scaling Governor.
     
3. If changing the governor, enter the desired governor when prompted.

## Choosing the Right CPU Scaling Governor
The choice of CPU scaling governor should be based on your system's needs and priorities, such as performance or power efficiency. Here's a brief guide to help you decide:

1. <b>performance:</b> Maximizes computational performance without regard to power consumption.
2. <b>powersave:</b> Minimizes power consumption at the expense of computational performance.
3. <b>ondemand:</b> Dynamically increases CPU speed when needed, offering a balance between performance and power usage.
4. <b>conservative:</b> Similar to ondemand but increases CPU frequency more gradually.
5. <b>schedutil:</b> Makes scaling decisions based on the scheduler's load tracking, potentially offering better efficiency.

## Factors to Consider
- <b>Workload Characteristics:</b>
1. <i>CPU Intensity:</i> If the tasks are CPU-intensive and require quick completion, then considering higher clock frequencies is necesary.
2. <i>Task Urgency:</i> If the tasks can afford slower processing times in exchange for energy savings, then lower clock frequencies is fine.

- <b>Energy vs. Performance Priorities:</b>
1. <i>Minimizing Energy Consumption:</i> If energy efficiency is a priority, a governor like ‘powersave’ may be suitable as it sets the CPU statically to the lowest frequency within operational limits.
2. <i>Maximizing Performance:</i> If performance is critical, the ‘performance’ governor may be more appropriate as it sets the CPU statically to the highest frequency within the scaling range.

##References

1. Kernel Documentation. (2017). CPU Performance Scaling. Retrieved from https://www.kernel.org/doc/html/v4.14/admin-guide/pm/cpufreq.html
2. Stack Exchange. (2018). What are the implications of setting the CPU governor to “performance”? Retrieved from https://unix.stackexchange.com/questions/439340/what-are-the-implications-of-setting-the-cpu-governor-to-performance 
