# ELEE1119 Assignment Brief: High-Performance Computing System Design and Implementation

**Submission Date: 27th March 2024 @ 1500**

**Viva: 27th March 2024 @ 1530-1620**

**Weighting: 60%**

---

## Introduction

In the field of advanced computer engineering, collaborative projects in large teams are commonplace. This coursework aims to simulate such an experience by requiring you to conceive, design, implement, and operate a project using various hardware provided by the University of Greenwich.

### Objectives

1. **Conception:** Conceive a scenario where Single Board Computers, Robotic Arms, Robotic Vehicles, Flick (e-field), Webcams, Touchscreens, Azure development kit, sensors, actuators, and other components complement each other.

2. **Team Structure:** Nominate a project manager to oversee the entire project and initialize a GitHub repository for collaborative development.

3. **Development:** Break the team into sub-teams, each responsible for developing a specific part of the project. Ensure all sub-parts seamlessly work together in the finished project.

4. **Documentation:** Add all code and documentation to the GitHub repository, maintaining an organized structure with branches for development and subsequent merges.

5. **Presentation:** Deliver a video viva presentation following the flow of an engineering report: introduction, problem analysis, problem solution, results, discussion, and conclusion.

## Hardware and Software

### Hardware

- Mother/Single Board Computers (e.g., Raspberry Pis, Jetson Nanos, Odriod, Rock, ASUS CS-8 motherboards)
- PSU
- SD/SSD
- Keyboard/Mouse
- WiFi dongle
- Ethernet cables
- 3D printing - material
- laser cutting - material
- fans
- mineral oil?

### Software

- Languages: Python, Shell, C/C++/C#, and any others deemed appropriate
- Git
- Github
- Slurm, singularity, Jack the Ripper etc

## Deliverables/Tasks

1. **System Design and Architecture:**
   - Design the architecture, integrating 14 ASUS CS-8 motherboards and single-board computers.
   - Provide critical reflections on the chosen design.

2. **Technology Research:**
   - Conduct comprehensive research on HPC technologies, power management, non-volatile storage, and RAM.
   - Justify technology choices based on problem domain appropriateness.

3. **System Construction:**
   - Assemble the HPC system, implementing power management and resource-efficient configurations.
   - Configure non-volatile storage and RAM to meet performance requirements.

4. **Housing and Cooling Solutions:**
   - Design and implement housing/structure using laser cutting or additive manufacturing.
   - Discuss convection principles (natural and forced) for cooling.

5. **Operating System Selection:**
   - Choose an operating system (e.g., Linux - Ubuntu or declarative system - NixOS).
   - Justify the choice based on task requirements and overall design.

6. **Task Implementation:**
   - Configure the single-board computer as the head node with WiFi access.
   - Implement tasks such as password cracking, DNA sequencing, and weather prediction using relevant packages/libraries (e.g., slurm, singularity).

7. **Performance Evaluation:**
   - Develop a strategy for evaluating HPC system performance.

8. **Software and OS Maintenance:**
   - Implement a system for updating software and the operating system using cron and Git.
   - Reflect on the importance of software and OS maintenance in an HPC environment.

You will work as one team to conceive a scenario that the components provided to you can compliment.   

In this initial stage you will nominate a project manager to oversee the entire project and be responsible for initialising the GitHub repository through which you will all contribute through. 

The team will be broken down into sub teams whose tasks will be to develop a specific part of the project. All the sub parts should work together in the finished project.  

All code and documentation must be added to the Github repository, and the Github repository should have a sufficient number of branches for project development and subsequent merges to the ‘main’ branch as the project develops. 

A video viva presentation must be delivered that includes; a suitable logo, development of the project and final working demonstration. The format of the video should follow the flow of an engineering report: introduction, problem analysis, problem solution, results, discussion and conclusion.  

Video must be uploaded to private channel YouTube and shared via link using the **[Coursework Submission Document](https://moodlecurrent.gre.ac.uk/mod/resource/view.php?id=2526729)**

## Assessment Criteria

- Assessment based on critical thinking, technical implementation, documentation quality, and teamwork/self-evaluation.
- Detailed rubric provided for both group and individual assessments.

---

This assignment challenges your understanding of computer architecture, system design, and collaborative project implementation. If questions arise or clarification is needed, contact your module leader. Best of luck!


## Rubric in Full
    
<div align=center>

 **Rubric for : Group Assessment (60%)**

| Criteria                                      | Excellent (9-10) | Proficient (6-8) | Basic (3-5) | Limited (0-2) |
|----------------------------------------------|-------------------|------------------|-------------|--------------|
| **Clearly Defined Coursework Scope**              | Clearly defines the coursework scope with precision and detail. | Defines the coursework scope effectively. | Defines the coursework scope with some gaps or ambiguity. | Fails to define the coursework scope adequately. |
| **Clear Breakdown of Workload**                   | Provides a clear and well-structured breakdown of workload for each team/member. | Offers a clear breakdown of workload with acceptable structure. | Presents a breakdown of workload with some gaps or lack of clarity. | Fails to provide a clear breakdown of workload. |
| **Technical Content**                             | Demonstrates a high level of technical content with depth and sophistication. | Presents technical content at a proficient level. | Provides technical content with some gaps or limited depth. | Technical content is insufficient or poorly presented. |
| **Depth of Discussion**                           | Engages in a thorough and insightful discussion, demonstrating a deep understanding of the project. | Provides a good level of discussion with reasonable insights. | Offers a discussion with some gaps or lacks in-depth insights. | Discussion is minimal or lacks depth. |
| **Clarity of Presentation**                     | Delivers a presentation with exceptional clarity, structure, and coherence. | Presents information with clear organization and coherence. | Presentation has some organizational issues or lacks clarity at times. | Presentation is disorganized and challenging to follow. |
| **Working Demonstration of Project**              | Showcases a fully functional and well-demonstrated project with excellence. | Demonstrates a working project effectively. | Provides a working demonstration with some issues or limitations. | Fails to provide a satisfactory working demonstration. |
| **GitHub Fully Setup**                            | Sets up GitHub repository fully, with branches and effective project management. | Sets up GitHub repository well, with acceptable project management. | Sets up GitHub with some issues or lacks effective project management. | GitHub setup is inadequate or poorly managed. |
</div>

--------------

<div align=center>

 **Rubric for : Individual Assessment (40%)**

| Criteria| Excellent (9-10) | Proficient (6-8) | Basic (3-5) | Limited (0-2) |
|---------|-------------------|------------------|-------------|--------------|
| **Consistent Contribution via Git**| Consistently contributes to the project through Git with a high level of engagement. | Makes regular and effective contributions to the project via Git. | Contributes to the project via Git with some irregularities or inefficiencies. | Contribution to the project via Git is inconsistent or ineffective. |
| **Quality of Documentation**| Provides documentation of exceptional quality, adhering to industry conventions. | Delivers documentation of good quality, following industry conventions. | Documentation has some issues or lacks completeness. | Documentation is of poor quality or incomplete. |
| **- README (50%)**| The README is well-structured, comprehensive, and provides essential project information. | The README is adequately structured and contains most essential project information. | The README is somewhat disorganized or lacks some essential project information. | The README is disorganized or missing crucial project information. |
| **- Code Documentation (50%)**| Code documentation is thorough, clear, and follows industry standards. | Code documentation is sufficient, clear, and follows industry standards. | Code documentation has some gaps or lacks clarity. | Code documentation is inadequate or unclear. |
| **Video Viva Q&A**| Engages effectively in the video viva Q&A, providing insightful and articulate responses. | Participates well in the video viva Q&A with clear and thoughtful responses. | Responds to video viva Q&A with some gaps or lacks clarity. | Video viva Q&A responses are unclear or incomplete. |

</div>

_ **The HPC'S purpose** _

_ **There are three sub-components to the HPC'S purpose in order for it to function fully.** _

- _Background information on each selected crypto_
- _Recent fluctuations in the price and trading patterns_
- _Predicted outcomes and investment recommendation_
- _Choose operating system for Hpc_

_ **Background information on each selected crypto** _

_Cryptocurrency is a digital asset that is secured by cryptography. This type of money allows for decentralized transactions, meaning that a central authority, such as a bank, does not handle, verify, or regulate the transactions. An example of the information that the HPC could collect are, when the currency was made, how much its currently worth and the advantage and disadvantages to it like where it is and isn't accepted_

_ **Recent fluctuations in the price and trading patterns** _

_It is not unusual for the price of Bitcoin (BTC 0.72%) to fluctuate by 5% or even 10% every day. Wider price fluctuations can occur with smaller coins. because supply and demand, investors and users' mood, laws, and media hype all have an impact. All these elements work together to cause price volatility. This will show use if the coin is on the right trajectory or if we should cut our losses_

_ **Predicted outcomes and investment recommendation** _

_In order for the HPC to figure out how to give suggestion that track with the current stats of the coin we will have to utilize machine learning.__A field of computer science and artificial intelligence (AI) called "machine learning" focuses on using data and algorithms to simulate human learning processes and progressively increase their accuracy. By using machine learning we can utilize the information we gathered in the first two step to create an algorithm that can not only get you when to invest but how to invest with the hope that this will limit the risk in error my taking out the human error possibility_

_ **Combined step** _

_Once all the above steps are combined, we should have a HPC that will be able to select and recommend cryptocurrency as well as improve itself the more and more the machine is used_

_ **Software languages for a HPC** _

_ **Fortran** _

Fortran (Formula Translation) is one of the oldest high-performance programming languages and is widely used in scientific computing. It is designed to handle complex numerical calculations and has built-in support for parallel processing. Fortran is known for its excellent performance, especially for scientific applications.

**Pros**

- Built-in support for parallel processing
- Can handle complex calculations
- Mature and stable language with decades of development and optimization
- Excellent performance in numerical computing

**Cons**

- Limited functionality for non-numerical tasks
- The syntax may be difficult for beginners to learn
- Limited libraries for non-scientific tasks.
- Lack of modern features found in newer programming languages

**C#/C++**

C/C++ is another popular high-performance programming language used in scientific computing. It is a general-purpose language and is known for its speed, efficiency, and memory management/C++ is used extensively in scientific simulations and numerical computing.

**Pros**

- _High performance, efficient language._
- _Compilable to run on multiple platforms._
- _Numerous libraries and frameworks for scientific computing._
- _Better performance than interpreted languages._

_ **Cons** _

- _No automatic garbage collection, leading to memory leaks if not managed properly._
- _Prone to security vulnerabilities like buffer overflows._
- _Development and maintenance require more time and effort than higher-level languages._
- _Debugging can be more challenging and requires advanced programming skills._

_ **Python** _

_Python is a popular programming language used in scientific computing due to its simplicity, ease of use, and wide range of libraries. It is a high-level language and is widely used in data analysis, machine learning, and scientific computing. Python has built-in support for numerical calculations and visualization_.

**Pros**

- Easy to learn and use
- Widely used in scientific computing, data analysis, and machine learning
- Cross-platform compatibility
- Built-in support for numerical calculations and visualization
- A wide range of libraries and frameworks are available

**Cons**

- _Limited mobile app development support_
- _Not suitable for low-level programming_
- _Limited support for GUI development_

_ **HPC most used language** _

_The most popular high-productivity language in scientific computing is called Python. It's perfect for rapidly developing scalable apps because of its extensive library support and extremely easy syntax._

_In contrast to Julia, Python is not at all HPC capable. The kinds of data structures and other characteristics required for quick computations are not natively supported by the language. But over time, Python interfaces to several C/C++ libraries have been created, and Python now includes data types and algorithms for incredibly effective array operations thanks to the NumPy extension._

_Python today is the number one language for machine learning and many other demanding HPC applications._

_Although languages like c# and java outperform phyton in terms of speed and runtime performance. Phyton is more regularly used as it is faster to development in projects due to its ease of uses and it readability its many libraries also give python access to the same algorithms and data types as java and c_

_The next favorable language to use would be java.__Java code is consistently quicker than C code when program development is given the same window of operation. Java HPC makes perfect sense for code development and modification on a regular basis._

_Fortran is a highly recommended language to use also and was the go-to language for HPC'S. It was first created in 1957 and went on to dominate the computer science field for many years. However, with newer languages being developed Fortran became outdated and does not have the capability to keep up efficiently with the likes of java or python anymore_

_ **Other possibly relevant information** _

[_ **https://www.scientific-computing.com/tech-focus/latest-software-tools-HPC** _](https://www.scientific-computing.com/tech-focus/latest-software-tools-HPC)

[_ **https://www.hpe.com/uk/en/compute/hpc/hpc-software.html** _](https://www.hpe.com/uk/en/compute/hpc/hpc-software.html)

