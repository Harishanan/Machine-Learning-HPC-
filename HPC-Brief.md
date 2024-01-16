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

