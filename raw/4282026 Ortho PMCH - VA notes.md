Questions:

- How do complaints come in today- what systems?

- Team in the field fills out a form - sales rep, person working in the OR, etc.
- Very small number of complaints we would get from patients directly
- Who is the end user of a solution to help with this?

- "while integrating with existing validated RPA workflows for PI creation and regulatory submissions" - describe these workflows?
- Complaint volume today? - See deck
- Benefits & time savings in the deck- are there other benefits not related to time efficiency? - covered in 4/28 deep dive

- Better customer experience?
- Less regulatory risk? What could happen today if something is missed and not reported?

Focus - make front end of complaint handling smarter

Track wise - system of record for complaints

Data quality impacted by intake back and forth

Complaint team submits complaint via msft forms - couple ways of submitting these complaints

Goes into trackwise via power automate & API

Most of the form volume goes through Microsoft form (Stryker rep in the field)

Replacing RPA - PowerAutomate to UIPath (why UIPath? What are the current limitations?)

PowerAutomate desktop flow to pull sharepoint list

Manual review prior to entry to TrackWise (flow is triggered by specialist)

HITL for big decisions

What does the RPA tool contribute in the process?

Power automate rips info from form and puts it into an email for the team so the team can submit the trackwise case

PI is the parent of the complaint - multiple incidents could be on that event

Sharepoint list to trackwise - not automated. Manually the email & sharepoint list is reviewed and then this goes to trackwise. They want to vet the MSFT form content- sometimes there is a typo. Use case do field mapping so that this data is validated.

Email not very valuable - this was just in the old process and

MSFT form has branching but that's the extent of complexity

Decision is logged to Sharepoint list - then pushed into trackwise

Why was the solution built in this way- seems so hacky and disjointed? Thoughts on having a complaint application built out?

40K complaints annually - JR & MET only

131K across all divs

Intangible benefits:

- 90 days of age to close complaints in some cases - poor customer experience
- Audit risk & cost associated if these are not reported

Complaints all come in in English - high volume in US. Would want to tackle this first.

Phase 1- built an AI to classify failure mode. For the easy ones, AI makes decisions and the team reviews them and provides feedback. Runs on a scheduled basis, M and F. Ambition to handle more complex cases.

RPA components to this solution too.

Happens not at the parent level - at the lower complaint level. PI is the parent, complaint is the child.

Expectation that automation will move to IT - not live in business

Add failure mode classification early - handle this in the form

Couple of use cases - 1) expand failure mode classification 2) improve intake process / do failure mode classification earlier

Key goal is completeness of information at intake

Around 40-50% require an inspection

Complaint intake - applies across Stryker

Follow-ups:

- Inputs & outputs for failure mode classification
- Architecture of failure mode classification solution today
- Dive into why the solution was built how it is today (was there a skillset gap- rationale for only using power platform tools?) Seems very hacky & disjointed
- Value add of expanding failure mode classification vs. ai-enabled intake as a prototype

- Expanding existing failure mode classification feels out of scope of FDE a bit but should be worked on at some point - not something we could quickly show

- What is the master file?
- Need more details on the RPA process - can we rebuild them?

- What does it do?

- When does the review happen? Our new solution can't go from user to trackwise- so where is the review

- Application we protype?