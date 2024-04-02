# Performance Evaluation

As the HPC system was built for this project, a series of tests were conducted to evaluate its performance. The steps and guidelines described above, including networking, power on/off functions, prometheus, Grafana, the justification for choosing operating systems and designs’ tests have demonstrated that the specific tasks or designs function very well. With this knowledge, let's explore how the HPC system efficiently runs the application and performs predictions far better compared to general computers, such as laptops and desktops.

## 1. Timing for cryptocurrency prediction:
General Computer: 8 minute 49 seconds
HPC built in this project: 2 minute 48 seconds


## 2. Cores and processor used for cryptocurrency prediction:
General computer: 6 cores	(i5 processor 9th generation)
HPC built in this project: 16 cores  (4 X i5 processor 9th generation)

As, mentioned above, the cryptocurrency prediction in general computer, took 8 minutes 49 seconds (which has i5 processor 9th generation). Therefore, to enhance the performance of prediction, in this project number of motherboards were connected together and tested making HPC with modular design (increasing number of motherboards)

| No of motherboards used | 1 x i5 4th gen motherboard | 2 x i5 processor 9th generation | 3 x i5 processor 9th generation | i5 processor 9th generation |
|---------------|----------------|------------------|---------------|-------------------|
| Time it took | 19 minutes 02 seconds | 14 minutes 03 seconds | 7 minutes 59 seconds | 2 minutes 48 seconds |

•	**Scalability:**
A crucial advantage of the HPC system over general computers is its scalability. The system has been designed with the ability to scale out by adding more nodes or scale up by enhancing existing nodes with more powerful components. This scalability ensures that as the complexity of the prediction models or the volume of data increases, the system can be expanded to maintain or even reduce computation times.

•	**Energy Efficiency:**
While the HPC system boasts a higher number of cores and substantially faster processing times, it's also designed with energy efficiency in mind. The choice of components and the system's architecture are optimized to balance high performance with energy usage, making it not only faster but also more cost-effective in terms of energy consumption compared to running similar tasks on general-purpose computers over extended periods.

The comparative analysis between the HPC system and a general-purpose computer highlights the former's superior performance, scalability, energy efficiency, reliability and networking capabilities. These attributes make the HPC system exceptionally well-suited for running complex and data-heavy applications, confirming its value and effectiveness for the project's objectives. Future work may focus on further optimizing these aspects, exploring additional computational models, and expanding the system's capabilities to address even more demanding computational challenges.

